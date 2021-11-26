//
//  URLRequestFactory.swift
//  Networking
//
//  Created by William Boles on 23/11/2021.
//

import Foundation

public protocol URLRequestFactoryType {
    func request(endPoint: String, method: HTTPRequestMethod) -> URLRequest
}

open class URLRequestFactory: URLRequestFactoryType {
    
    // MARK: - Init
    
    public init() { }
    
    // MARK: - Factory
    
    public func request(endPoint: String, method: HTTPRequestMethod) -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = endPoint
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "34a92f7d77a168fdcd9a46ee1863edf1")
        ]
        
        guard let url = components.url else {
            fatalError("URL is malformed")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
