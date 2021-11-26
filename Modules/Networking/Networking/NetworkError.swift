//
//  NetworkError.swift
//  Networking
//
//  Created by William Boles on 16/11/2021.
//

import Foundation

public enum NetworkError: Error {
    case retrievalError(underlayingError: Error?, response: URLResponse?)
    case invalidData(underlayingError: Error?)
    case parsingError(underlayingError: Error?)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .retrievalError(let underlyingError, let response):
            var localizedDescription = "Unable to retrieve content"
            if let response = response {
                if let url = response.url {
                    localizedDescription += " from \(url)"
                }
                if let httpResponse = response as? HTTPURLResponse {
                    localizedDescription += " received status code \(httpResponse.statusCode)"
                }
            }
            if let underlyingError = underlyingError {
                localizedDescription += " with underlaying error \(underlyingError.localizedDescription)"
            }
            return localizedDescription
        case .parsingError(let underlyingError):
            var localizedDescription = "Unable to parse content"
            if let underlyingError = underlyingError {
                localizedDescription += " with underlaying error \(underlyingError.localizedDescription)"
            }
            return localizedDescription
        }
    }
}
