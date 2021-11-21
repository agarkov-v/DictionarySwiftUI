//
//  MockHelper.swift.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.11.2021.
//

import Foundation
import Combine

class MockHelper {
	// MARK: Properties

	static var mockDefinitionsData: [DefinitionItem] {
		var definitions: [DefinitionItem] = []
		definitions.append(contentsOf: friendMockData.definition)
		definitions.append(contentsOf: petMockData.definition)
		return definitions
	}

	static var friendMockData: TranslationResponse {
		return makeMockData(.friend)
	}

	static var petMockData: TranslationResponse {
		return makeMockData(.pet)
	}

	// MARK: Methods

	static func mockRequestTranslation() -> AnyPublisher<URLSession.DataTaskPublisher.Output, Error> {
		let urlString = "https://dictionary.yandex.net/api/v1/dicservice.json/lookup"
		guard
			let url = URLComponents(string: urlString)?.url
		else {
			return Fail(error: AppError.badURL(urlString)).eraseToAnyPublisher()
		}

		guard let response: URLResponse = HTTPURLResponse(
			url: url,
			statusCode: 200,
			httpVersion: "HTTP/1.1",
			headerFields: nil
		) else {
			return Fail(error: AppError.customError("Wrong Response")).eraseToAnyPublisher()
		}

		let encoder = JSONEncoder()
		let friendMock = friendMockData
		do {
			let friendData = try encoder.encode(friendMock)
			return Just((data: friendData, response: response))
				.setFailureType(to: Error.self)
				.eraseToAnyPublisher()
		} catch {
			return Fail(error: AppError.customError(urlString)).eraseToAnyPublisher()
		}
	}

	private static func makeMappedResponse(with response: Any) throws -> TranslationResponse {
		let jsonData = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
		let mappedResponse = try JSONDecoder().decode(TranslationResponse.self, from: jsonData)
		return mappedResponse
	}

	private static func makeMockData(_ filename: MockDataLocalFilename) -> TranslationResponse {
		let optMockData: TranslationResponse? = LocalDataLoadHelper.load(filename.rawValue) as TranslationResponse?
		guard let mockData = optMockData else { return .emptyResponse }
		return mockData
	}
}

// MARK: MockDataLocalFilename

private extension MockHelper {
	private enum MockDataLocalFilename: String {
		case friend = "TranslateResponseFriendMock"
		case pet = "TranslateResponsePetMock"
	}
}
