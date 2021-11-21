//
//  AppError.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 29.08.2021.
//

import Foundation

enum AppError: Error {
	case unknown
	case notConnectedToInternet
	case badResponseCode
	case badURL(_ errorText: String?)
	case customError(_ errorText: String?)
}

extension AppError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .unknown:
			return "UnknownError"

		case .badResponseCode:
			return "BadResponseError"

		case .notConnectedToInternet:
			return "NotConnectedError"

		case .badURL(let error):
			return error ?? "BadURLError"

		case .customError(let error):
			return error ?? "CustomError"
		}
	}
}
