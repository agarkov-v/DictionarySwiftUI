//
//  TranslationResponse.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct TranslationResponse: Codable {
    
    let definition: [DefinitionItem]
    
    enum CodingKeys: String, CodingKey {
        case definition = "def"
    }
}

// MARK: Data

extension TranslationResponse {
    
    static let emptyResponse = TranslationResponse(definition: [])
    
    static var friendMockData: TranslationResponse {
        return makeMockData(.friend)
    }
    
    static var petMockData: TranslationResponse {
        return makeMockData(.pet)
    }
    
    static func makeMappedResponse(with response: Any) throws -> TranslationResponse {
        let jsonData = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
        let mappedResponse =  try JSONDecoder().decode(TranslationResponse.self, from: jsonData)
        return mappedResponse
    }
    
    private static func makeMockData(_ filename: MockDataLocalFilename) -> TranslationResponse {
        let optMockData: TranslationResponse? = LocalDataLoadHelper.load(filename.rawValue) as TranslationResponse?
        guard let mockData = optMockData else { return .emptyResponse }
        return mockData
    }
}

// MARK: MockDataLocalFilename

private extension TranslationResponse {
    
    private enum MockDataLocalFilename: String {
        case friend = "TranslateResponseFriendMock"
        case pet = "TranslateResponsePetMock"
    }
}
