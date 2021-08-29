//
//  DataService+Translate.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 30.08.2021.
//

import Foundation
import Combine

extension DataService {
    
    func requestTranslation(for word: String,
                            fromLanguage: Language,
                            toLanguage: Language) -> AnyPublisher<TranslationResponse, Error> {
        
        return performRequest(method: .get,
                              url: <#T##URL#>,
                              parameters: <#T##JSONDictionary?#>)
            .map { data -> TranslationResponse in
                
            }
    }
}
