//
//  SignUpView.swift
//  MeloSync
//
//  Created by santiago on 12/31/23.
//

import SwiftUI
import FirebaseFirestore

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var phoneNumber = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var userName = ""
    
    @State private var isUsernameAvailable = false
    @State private var isEmailAvailable = false

    
    @EnvironmentObject private var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Fill out the fields to begin your profile")
                .font(.title2)
            
            HStack {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            TextField("Username", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()
                .onChange(of: userName) {
                    Task {
                        isUsernameAvailable = await isUsernameUnique(userName.lowercased())
                    }
                }
            
            if !isUsernameAvailable {
                Text("Username is not valid")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
            
            
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()
            
            if !isUsernameAvailable {
                Text("Email is not valid")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
            
            
            TextField("Phone Number", text: $phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.phonePad)
                .autocorrectionDisabled()
            
   
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()
            
            if password != confirmPassword {
                Text("Passwords do not match")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()

            
            Button("Sign Up") {
                Task {
                    print("PRessed")
                    try await viewModel.createUser(
                        withEmail:email.lowercased(),
                        firstName:firstName,
                        lastName:lastName,
                        userName: userName.lowercased(),
                        phoneNumber:phoneNumber,
                        password:password
                    )
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(formIsValid ? Color.blue : Color.gray.opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button {
                dismiss()
            } label: {
                AlreadyHaveAccountView()
                    .foregroundStyle(.black)
            }
        }
        .padding()
    }
}

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        Task {
            isUsernameAvailable = await isUsernameUnique(userName)
            isEmailAvailable = await isEmailUnique(email)
        }
        return !email.isEmpty
        && isEmailAvailable
        && password.count > 5
        && !password.isEmpty
        && !confirmPassword.isEmpty
        && !phoneNumber.isEmpty
        && !firstName.isEmpty
        && !lastName.isEmpty
        && password == confirmPassword
        && !userName.isEmpty
        && isUsernameAvailable
    }
    
}


#Preview {
    SignUpView()
        .environmentObject(AuthViewModel())
}
