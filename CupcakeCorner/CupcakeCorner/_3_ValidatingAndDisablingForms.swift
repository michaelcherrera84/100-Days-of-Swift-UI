//
//  _3_ValidatingAndDisablingForms.swift
//  CupcakeCorner
//
//  Created by Michael C. Herrera on 10/19/25.
//

import SwiftUI

struct _3_ValidatingAndDisablingForms: View {
    @State private var userName = ""
    @State private var email = ""
    
    var disableForm: Bool {
        userName.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $userName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(/* userName.isEmpty || email.isEmpty // or */ disableForm)
        }
    }
}

#Preview {
    _3_ValidatingAndDisablingForms()
}
