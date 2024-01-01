//
//  AlreadyHaveAccountView.swift
//  MeloSync
//
//  Created by santiago on 1/1/24.
//

import SwiftUI

struct AlreadyHaveAccountView: View {
    var body: some View {
        HStack {
            Text("Aleady Have an account??")
            Text("Log-In")
                .underline()
                .fontWeight(.semibold)
        }
        .font(.caption)
    }
}

#Preview {
    AlreadyHaveAccountView()
}
