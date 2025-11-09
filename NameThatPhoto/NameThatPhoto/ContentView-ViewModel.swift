//
//  ContentView-ViewModel.swift
//  NameThatPhoto
//
//  Created by Michael C. Herrera on 11/8/25.
//

import Foundation
import PhotosUI

extension ContentView {
    @Observable
    class ViewModel {
        let savePath = URL.documentsDirectory.appending(path: "Data")
        
        private(set) var namedPhotos: [NamedPhoto]
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                namedPhotos = try JSONDecoder().decode([NamedPhoto].self, from: data)
            } catch {
                namedPhotos = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(namedPhotos)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func add(namedPhoto: NamedPhoto) {
            namedPhotos.append(namedPhoto)
            save()
        }
    }
}
