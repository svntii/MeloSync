//
//  LoginView.swift
//  MeloSync
//
//  Created by santiago on 12/31/23.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var verificationCode = ""
    @State private var isCodeSent = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment:.leading) {
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.system(size: 18))
                
                TextField("fake@maildotcom", text: $email)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.phonePad)
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .font(.system(size: 18))
                
                SecureField("C0mp!icat3dPa$$word", text: $password)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
                    .autocorrectionDisabled()
                
            }
            
            
            
            Button("Sign-In") {
                Task {
                    try await viewModel.signInUserEmailPassword(withEmail: email, password: password)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(formIsValid ? Color.blue : Color.gray.opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(8)
            .disabled(!formIsValid)

            NavigationLink {
                SignUpView()
            } label: {
                SignUpPromptView()
                    .padding(.top, 0)
                    
            }
            .foregroundStyle(.black)
            
        }
        .padding()
    }
}


extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty 
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        
    }
    
    
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}

