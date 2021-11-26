//
//  URLRequestFactory.swift
//  MovieRepository
//
//  Created by William Boles on 23/11/2021.
//

import Foundation
import Networking

public protocol MovieURLRequestFactoryProtocol {
    func retrieveMovieFeedRequest(_ movieFeed: MovieFeed) -> URLRequest
}

public class MovieURLRequestFactory: URLRequestFactory, MovieURLRequestFactoryProtocol {
    
    // MARK: - Init
    
    public override init() { super.init() }
    
    // MARK: - Feed
    
    public func retrieveMovieFeedRequest(_ movieFeed: MovieFeed) -> URLRequest {
        request(endPoint: movieFeed.path(), method: .get)
    }
}
