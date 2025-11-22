//
//  _1_Letting_users_select_items_in_a_List.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftUI

struct _1_Letting_users_select_items_in_a_List: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
//    @State private var selection: String?
    @State private var selection = Set<String>()
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
//        if let selection {
//            Text("You selected \(selection)")
//        }
        
        if !selection.isEmpty {
            Text("You selected \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    _1_Letting_users_select_items_in_a_List()
}
