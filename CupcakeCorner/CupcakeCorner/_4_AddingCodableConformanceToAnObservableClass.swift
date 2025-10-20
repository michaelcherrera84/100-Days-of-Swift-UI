//
//  _4_AddingCodableConformanceToAnObservableClass.swift
//  CupcakeCorner
//
//  Created by Michael C. Herrera on 10/19/25.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Taylor"
}

struct _4_AddingCodableConformanceToAnObservableClass: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    _4_AddingCodableConformanceToAnObservableClass()
}
