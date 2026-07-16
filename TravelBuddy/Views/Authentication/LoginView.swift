import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""

    @State private var errorMessage = ""

    @StateObject private var authManager = AuthManager.shared

    var body: some View {

        VStack(spacing: 20) {

            Spacer()

            Text("Travel Buddy")
                .font(.largeTitle)
                .bold()

            Text("Plan Your Next Journey")
                .foregroundStyle(.gray)

            CustomTextField(title: "Email", text: $email)

            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

            if !errorMessage.isEmpty {

                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            PrimaryButton(title: "Login") {

                authManager.signIn(email: email, password: password) { error in

                    if let error = error {

                        errorMessage = error

                    } else {

                        errorMessage = ""
                    }
                }

            }

            Button {

                authManager.signInWithGoogle { error in

                    if let error = error {

                        errorMessage = error

                    } else {

                        errorMessage = ""
                    }

                }

            } label: {

                HStack(spacing: 12) {

                    Image(systemName: "globe")

                    Text("Continue with Google")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)
            }

            NavigationLink("Create Account") {

                RegisterView()

            }

            Spacer()

        }
        .padding()
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {

    NavigationStack {

        LoginView()

    }

}
