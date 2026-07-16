import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore
import UIKit
import Combine

class AuthManager: ObservableObject {

    static let shared = AuthManager()

    @Published var user: User?

    private init() {

        user = Auth.auth().currentUser

        Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                self.user = user
            }
        }
    }

    // MARK: Email Register

    func signUp(
        email: String,
        password: String,
        completion: @escaping (String?) -> Void
    ) {

        Auth.auth().createUser(withEmail: email, password: password) { result, error in

            if let error = error {

                completion(error.localizedDescription)
                return
            }

            self.user = result?.user

            completion(nil)
        }
    }

    // MARK: Email Login

    func signIn(
        email: String,
        password: String,
        completion: @escaping (String?) -> Void
    ) {

        Auth.auth().signIn(withEmail: email, password: password) { result, error in

            if let error = error {

                completion(error.localizedDescription)
                return
            }

            self.user = result?.user

            completion(nil)
        }
    }

    // MARK: Google Login

    func signInWithGoogle(
        completion: @escaping (String?) -> Void
    ) {

        guard
            let clientID = FirebaseApp.app()?.options.clientID
        else {

            completion("Client ID not found")
            return
        }

        let config = GIDConfiguration(clientID: clientID)

        guard
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = scene.windows.first?.rootViewController
        else {

            completion("Root View Controller not found")
            return
        }

        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in

            if let error = error {

                completion(error.localizedDescription)
                return
            }

            guard
                let user = result?.user,
                let idToken = user.idToken?.tokenString
            else {

                completion("Google Login Failed")
                return
            }

            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )

            Auth.auth().signIn(with: credential) { authResult, error in

                if let error = error {

                    completion(error.localizedDescription)
                    return
                }

                self.user = authResult?.user

                completion(nil)
            }
        }
    }

    // MARK: Logout

    func signOut() {

        do {

            try Auth.auth().signOut()

            GIDSignIn.sharedInstance.signOut()

            user = nil

        } catch {

            print(error.localizedDescription)
        }
    }

}
