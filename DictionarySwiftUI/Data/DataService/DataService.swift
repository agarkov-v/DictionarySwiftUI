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
    
    private let apiKey = "dict.1.1.20210819T084112Z.53ed90b206cef750.c5652f7c3f878ad5d505bc11be767bba67ea8856"
    
    // MARK: Public Methods
    
    func performRequest(method: HttpMethod,
                        url: URL,
                        parameters: JSONDictionary? = nil) -> AnyPublisher<Data, Error> {
        do {
            guard
                let requestURL = try makeURLWithQueryItems(method: method,
                                                           url: url,
                                                           additionalParameters: parameters).url
            else {
                return Fail(error: AppError.badURL(url.absoluteString)).eraseToAnyPublisher()
            }
            
            var request = URLRequest(url: requestURL)
            request.httpMethod = method.rawValue
            if let parameters = parameters {
                //            do {
                let bodyData = try JSONSerialization.data(withJSONObject: parameters,
                                                          options: .prettyPrinted)
                request.httpBody = method == .get ? nil : bodyData
                //            } catch let error {
                //                return Fail(error: error).eraseToAnyPublisher()
                //            }
            }
            
            let publisher = URLSession.shared.dataTaskPublisher(for: request)
                .mapError { $0 as Error}
                //            .map { $0.data }
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
    
    private func makeURLWithQueryItems(method: HttpMethod,
                                       url: URL,
                                       additionalParameters: JSONDictionary?) throws -> URLComponents {
        guard
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        else {
            throw AppError.badURL(url.absoluteString)
        }
        
        components.queryItems = getQueryItems(queryItems: components.queryItems,
                                              parameters: method == .get ? additionalParameters : nil)
        return components
    }
    
    private func getQueryItems(queryItems: [URLQueryItem]?, parameters: JSONDictionary?) -> [URLQueryItem]? {
        guard queryItems != nil || parameters != nil else { return nil }
        var allQueryItems: [URLQueryItem] = queryItems ?? []
        if let parameters = parameters, !parameters.isEmpty {
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
