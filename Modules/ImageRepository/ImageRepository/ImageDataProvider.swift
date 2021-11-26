//
//  ImageDataProvider.swift
//  ImageRepository
//
//  Created by William Boles on 25/11/2021.
//

import Foundation
import Networking

public ImageDataProvider {
    private let networkClient: NetworkClientProtocol
    
    // MARK: - Init
    
    public init(networkClient: NetworkClientProtocol = NetworkClient.defaultClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - Retrieval
    
    public func retrieveImage()
}
