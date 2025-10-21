//
//  _2_AcceptingMultiLineTextInputWithTextEditor.swift
//  Bookworm
//
//  Created by Michael C. Herrera on 10/20/25.
//

import SwiftUI

struct _2_AcceptingMultiLineTextInputWithTextEditor: View {
    @AppStorage("notes") private var notes = ""
    var body: some View {
        NavigationStack {
//            TextEditor(text: $notes)
//                .navigationBarTitle("Notes")
//                .padding()
            
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationBarTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    _2_AcceptingMultiLineTextInputWithTextEditor()
}
