//
//  Student.swift
//  Bookworm
//
//  Created by Michael C. Herrera on 10/20/25.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
