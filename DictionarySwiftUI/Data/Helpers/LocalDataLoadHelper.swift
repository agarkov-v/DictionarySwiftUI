//
//  LocalDataLoadHelper.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

final class LocalDataLoadHelper {
    
    enum FileExtension: String {
        case json
    }
    
    static func load<T: Decodable>(_ filename: String,
                                   fileExtension: FileExtension = .json) -> T? {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: fileExtension.rawValue) else {
            debugPrint("Couldn't find \(filename) in main bundle.")
            return nil
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            debugPrint("Couldn't load \(filename) from main bundle: \(error) \n\(error.localizedDescription)")
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            debugPrint("Couldn't parse \(filename) as \(T.self): \(error) | \(error.localizedDescription)")
            return nil
        }
    }
}
