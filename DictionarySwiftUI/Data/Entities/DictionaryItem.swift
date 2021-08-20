//
//  DictionaryItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct DictionaryItem {
    
    let dictionary: [TranslationResponse]
}

// MARK: Mock Data
extension DictionaryItem {
    
    static var mockData: [TranslationResponse] {
        let friendResponseMockData = TranslationResponse.petMockData
        let petResponseMockData = TranslationResponse.petMockData
        let mockData = [friendResponseMockData, petResponseMockData]
        return mockData
    }
}
