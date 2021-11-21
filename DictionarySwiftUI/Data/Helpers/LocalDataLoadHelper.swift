//
//  LocalDataLoadHelper.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

final class LocalDataLoadHelper {
	enum FileExtension: String {
		case json
	}

	static func load<T: Decodable>(
		_ filename: String,
		fileExtension: FileExtension = .json
	) -> T? {
		let data: Data

		guard let file = Bundle.main.url(forResource: filename, withExtension: fileExtension.rawValue) else {
#if DEBUG
			debugPrint("Couldn't find \(filename) in main bundle.")
#endif
			return nil
		}

		do {
			data = try Data(contentsOf: file)
			let decoder = JSONDecoder()
			return try decoder.decode(T.self, from: data)
		} catch {
#if DEBUG
			debugPrint("Error load file: \(error) \n\(error.localizedDescription)")
#endif
			return nil
		}
	}
}
