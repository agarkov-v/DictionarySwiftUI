//
//  ApiCallTest.swift
//  DictionarySwiftUITests
//
//  Created by Vyacheslav Agarkov on 22.10.2021.
//

import Combine
import XCTest
@testable import DictionarySwiftUI

class ApiCallTest: XCTestCase {
    
    private var dataService: DataService!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        dataService = DataService()
        cancellables = []
    }
    
    override func tearDown() {
        dataService = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testApiCallCompletes() {
        // given
        let word = "test"
        var responseError: Error?
        var definitions: [DefinitionItem] = []
        let expectation = expectation(description: "requestExpectation")
        
        // when
        dataService.requestTranslation(for: word)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let failError):
                        responseError = failError
                        expectation.fulfill()
                    case .finished:
                        expectation.fulfill()
                        break
                    }
                },
                receiveValue: { response in
                    definitions = response.definition
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        // then
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(definitions.first?.text, word)
    }
    
}
