//
//  Job.swift
//  SwiftDataProject
//
//  Created by Michael C. Herrera on 10/22/25.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String = "None"
    var priority: Int = 1
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.name = name
    }
}
