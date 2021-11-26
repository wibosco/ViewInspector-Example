//
//  MovieDataProvider.swift
//  MovieRepository
//
//  Created by William Boles on 23/11/2021.
//

import Foundation
import Networking

public class MovieDataProvider {
    private let networkClient: NetworkClientProtocol
    private let requestFactory: MovieURLRequestFactoryProtocol
    
    // MARK: - Init
    
    public init(networkClient: NetworkClientProtocol = NetworkClient.defaultClient, requestFactory: MovieURLRequestFactoryProtocol = MovieURLRequestFactory()) {
        self.networkClient = networkClient
        self.requestFactory = requestFactory
    }
    
    // MARK: - Feed
    
    public func retrieveFeed(_ feed: MovieFeed, callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[Movie], MovieError>) -> Void){
        let request = requestFactory.retrieveMovieFeedRequest(feed)
        networkClient.send(urlRequest: request) { (result: Result<MovieFeedResult, NetworkError>) in
            do {
                let movieResult = try result.get()
                let success = Result<[Movie], MovieError>.success(movieResult.movies)
                callbackQueue.async {
                    completion(success)
                }
                
            } catch {
                let failure = Result<[Movie], MovieError>.failure(MovieError.retrivalError(underlayingError: error))
                callbackQueue.async {
                    completion(failure)
                }
            }
        }
    }
}
