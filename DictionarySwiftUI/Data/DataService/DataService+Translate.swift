//
//  DataService+Translate.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 30.08.2021.
//

import Foundation
import Combine

extension DataService {
    
    func requestTranslation(for word: String) -> AnyPublisher<TranslationResponse, Error> {
        
        let urlString = "https://dictionary.yandex.net/api/v1/dicservice.json/lookup"
        guard
            let url = URLComponents(string: urlString)?.url
        else {
            return Fail(error: AppError.badURL(urlString)).eraseToAnyPublisher()
       }
        
        let fromLanguage = userSettings.fromLanguage
        let toLanguage = userSettings.toLanguage
        
        let apiKey = "dict.1.1.20210819T084112Z.53ed90b206cef750.c5652f7c3f878ad5d505bc11be767bba67ea8856" // Your Api Key
        let language = "\(fromLanguage.rawValue)-\(toLanguage.rawValue)"
        
        let parameters: JSONDictionary = [
            "key": apiKey,
            "lang": language,
            "text": word
        ]
        
        return performRequest(method: .get,
                              url: url,
                              parameters: parameters)
            .tryMap { data -> TranslationResponse in
                return try JSONDecoder().decode(TranslationResponse.self, from: data)
            }
            .eraseToAnyPublisher()
    }
}
