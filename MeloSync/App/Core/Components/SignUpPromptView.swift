//
//  SignUpPromptView.swift
//  MeloSync
//
//  Created by santiago on 1/1/24.
//

import SwiftUI

struct SignUpPromptView: View {
    var body: some View {
        HStack {
            Text("Don't have an account?")
            Text("Sign-up")
                .underline()
                .fontWeight(.semibold)
        }
        .font(.caption)
    }
    
}

#Preview {
    SignUpPromptView()
}
