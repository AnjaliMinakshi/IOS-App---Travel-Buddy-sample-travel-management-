import SwiftUI

struct RegisterView: View {

    @Environment(\.dismiss) var dismiss

    @State private var name = ""

    @State private var email = ""

    @State private var password = ""

    @State private var confirmPassword = ""

    @State private var errorMessage = ""

    @StateObject private var authManager = AuthManager.shared

    var body: some View {

        VStack(spacing: 20) {

            Text("Create Account")
                .font(.largeTitle)
                .bold()

            CustomTextField(title: "Name", text: $name)

            CustomTextField(title: "Email", text: $email)

            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

            if !errorMessage.isEmpty {

                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            PrimaryButton(title: "Register") {

                guard password == confirmPassword else {

                    errorMessage = "Passwords do not match"
                    return
                }

                authManager.signUp(email: email, password: password) { error in

                    if let error = error {

                        errorMessage = error

                    } else {

                        dismiss()

                    }

                }

            }

            Spacer()

        }
        .padding()

    }

}

#Preview {

    RegisterView()

}
