//
//  _2_WritingDataToTheDocumentsDirectory.swift
//  BucketList
//
//  Created by Michael C. Herrera on 10/29/25.
//

import SwiftUI

extension FileManager {
    func read(path: String) throws -> String {
        let url = URL.documentsDirectory.appending(path: path)
        return try String(contentsOf: url, encoding: .utf8)
    }
    func write(path: String, data: Data) throws {
        let url = URL.documentsDirectory.appending(path: path)
        try data.write(to: url, options: [.atomic, .completeFileProtection])
    }
}

struct _2_WritingDataToTheDocumentsDirectory: View {
    let fileManager = FileManager.default
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Message".utf8)
//            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
//                try data.write(to: url, options: [.atomic, .completeFileProtection])
//                let input = try String(contentsOf: url, encoding: .utf8)
//                print(input)
                try fileManager.write(path: "message.txt", data: data)
                try print(fileManager.read(path: "message.txt"))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    _2_WritingDataToTheDocumentsDirectory()
}
