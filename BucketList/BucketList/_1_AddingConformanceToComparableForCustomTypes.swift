//
//  _1_AddingConformanceToComparableForCustomTypes.swift
//  BucketList
//
//  Created by Michael C. Herrera on 10/29/25.
//

import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String

    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct _1_AddingConformanceToComparableForCustomTypes: View {
    //    let values = [1, 5, 3, 6, 2, 9].sorted()
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Krinstine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ]
    //    .sorted {
    //        $0.lastName < $1.lastName
    //    }
        .sorted()

    var body: some View {
        //        List(values, id: \.self) {
        //            Text(String($0))
        //        }
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
        .task {
            testComparable()
        }
    }
    
    func testComparable() {
        print(User(firstName: "Arnold", lastName: "Rimmer") < User(firstName: "Krinstine", lastName: "Kochanski"))
        print(User(firstName: "Arnold", lastName: "Rimmer") > User(firstName: "Krinstine", lastName: "Kochanski"))
    }
}

#Preview {
    _1_AddingConformanceToComparableForCustomTypes()
}
