//
//  _3_Understanding_Swifts_Result_type.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftUI

struct _3_Understanding_Swifts_Result_type: View {
    @State private var output = ""
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
//        do {
//            output = try result.get()
//        } catch {
//            output = "Error: \(error.localizedDescription)"
//        }
        
        switch result {
        case .success(let text):
            output = text
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    _3_Understanding_Swifts_Result_type()
}
