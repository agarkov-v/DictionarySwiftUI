//
//  TestClass.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 31.08.2021.
//

import Foundation
import Combine

class TestRequest {
    
    var translation: TranslationResponse?
    var cancellable = Set<AnyCancellable>()
    
    func testRequest() {
        
        cancellable.removeAll()
        DataService.shared.requestTranslation(for: "кот",
                                              fromLanguage: .russian,
                                              toLanguage: .english)
            .receive(on: DispatchQueue.main)
            .throttle(for: 0.5, scheduler: DispatchQueue.main, latest: true)
//            .last()
//            .breakpoint()
//            .removeDuplicates()
            .sink(receiveCompletion: { error in
                print("|| receiveCompletion: \(error)")
                switch error {
                case .failure(let failError):
                    print("|| \(failError.localizedDescription) ||| \(failError)")
                    self.translation = nil
                case .finished:
                    break
                }
            },
            receiveValue: { response in
                self.translation = response
                print("|| receiveValue: \(response)")
            })
            .store(in: &cancellable)
    }
}
