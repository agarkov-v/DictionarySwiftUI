//
//  RequestTranslationTest.swift
//  DictionarySwiftUITests
//
//  Created by Vyacheslav Agarkov on 22.10.2021.
//

import Combine
import XCTest
@testable import DictionarySwiftUI

class RequestTranslationTest: XCTestCase {
	private var dataService: DataService!
	private var cancellables: Set<AnyCancellable>!

	override func setUp() {
		super.setUp()
		dataService = DataService.shared
		cancellables = []
	}

	override func tearDown() {
		dataService = nil
		cancellables = nil
		super.tearDown()
	}

	func testRequestTranslation() {
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

	func testMockRequestTranslation() {
		var responseError: Error?
		var definitions: [DefinitionItem] = []
		let expectation = expectation(description: "requestExpectation")

		MockHelper.mockRequestTranslation()
			.sink(
				receiveCompletion: { completion in
					switch completion {
					case .failure(let failError):
						responseError = failError
						expectation.fulfill()
					case .finished:
						break
					}
				},
				receiveValue: { response in
					let data = response.data
					let translationResponse = try? JSONDecoder().decode(TranslationResponse.self, from: data)
					definitions = translationResponse?.definition ?? []
					expectation.fulfill()
				}
			)
			.store(in: &cancellables)

		wait(for: [expectation], timeout: 10)

		XCTAssertNil(responseError)
		XCTAssertEqual(definitions.first?.text, "friend")
	}
}
