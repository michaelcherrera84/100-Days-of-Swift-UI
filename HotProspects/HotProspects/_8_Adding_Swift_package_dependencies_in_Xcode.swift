//
//  _8_Adding_Swift_package_dependencies_in_Xcode.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SamplePackage
import SwiftUI

struct _8_Adding_Swift_package_dependencies_in_Xcode: View {
    let possibleNumber = 1...60
    
    var results: String {
        let selected = possibleNumber.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    _8_Adding_Swift_package_dependencies_in_Xcode()
}
