//
//  DataService.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 29.08.2021.
//

import Foundation
import Combine

typealias JSONDictionary = [String: Any]

class DataService {
	// MARK: Public Properties

	static let shared = DataService()

	// MARK: Private Properties

	private(set) var userSettings: UserSettings!
	private(set) lazy var definitionCDStorageService: DefinitionCDStorageServiceProtocol = DefinitionCDStorageService()

	private init(
		userSettings: UserSettings = UserSettings.shared
	) {
		self.userSettings = userSettings
	}

	// MARK: Public Methods

	func performRequest(
		method: HttpMethod,
		url: URL,
		parameters: JSONDictionary? = nil
	) -> AnyPublisher<Data, Error> {
		do {
			guard
				let requestURL = try makeURLWithQueryItems(
					method: method,
					url: url,
					additionalParameters: parameters
				).url
			else {
				return Fail(error: AppError.badURL(url.absoluteString)).eraseToAnyPublisher()
			}

			var request = URLRequest(url: requestURL)
			request.httpMethod = method.rawValue
			if let parameters = parameters {
				let bodyData = try JSONSerialization.data(
					withJSONObject: parameters,
					options: .prettyPrinted
				)
				request.httpBody = method == .get ? nil : bodyData
			}

			let publisher = URLSession.shared.dataTaskPublisher(for: request)
				.mapError { $0 as Error }
				.tryMap { [weak self] data, response -> Data in
					try self?.validate(response: response, data: data)
					return data
				}
				.eraseToAnyPublisher()

			return publisher
		} catch {
			return Fail(error: error).eraseToAnyPublisher()
		}
	}

	// MARK: Private Methods

	private func makeURLWithQueryItems(
		method: HttpMethod,
		url: URL,
		additionalParameters: JSONDictionary?
	) throws -> URLComponents {
		guard
			var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
		else {
			throw AppError.badURL(url.absoluteString)
		}

		components.queryItems = getQueryItems(
			queryItems: components.queryItems,
			parameters: method == .get ? additionalParameters : nil
		)
		return components
	}

	private func getQueryItems(queryItems: [URLQueryItem]?, parameters: JSONDictionary?) -> [URLQueryItem]? {
		guard queryItems != nil || parameters != nil else { return nil }
		var allQueryItems: [URLQueryItem] = queryItems ?? []
		if let parameters = parameters,
		   !parameters.isEmpty {
			for parameter in parameters {
				allQueryItems.append(
					URLQueryItem(name: parameter.key, value: String(describing: parameter.value))
				)
			}
		}

		return allQueryItems
	}

	private func validate(response: URLResponse, data: Data) throws {
		var error: Error?
		guard let httpResponse = response as? HTTPURLResponse else { return }

		if 200..<300 ~= httpResponse.statusCode {
			return
		} else {
			error = AppError.badResponseCode
		}

		if let error = error {
			throw error
		}
	}
}
