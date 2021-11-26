//
//  NetworkClient.swift
//  Networking
//
//  Created by William Boles on 16/11/2021.
//

import Foundation

public protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
    typealias DownloadTaskResult = (URL?, URLResponse?, Error?) -> ()
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func downloadTask(with request: URLRequest, completionHandler: @escaping DownloadTaskResult) -> URLSessionDownloadTask
}

extension URLSession: URLSessionProtocol { }

public protocol NetworkClientProtocol {
    func send<T: Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void)
}

public class NetworkClient: NetworkClientProtocol {
    private let session: URLSessionProtocol
    

    // MARK: - Init
    
    public init(session: URLSessionProtocol) {
        self.session = session
    }
    
    // MARK: - Send
    
    public func send<T: Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let task = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            guard error == nil else {
                let clientError = NetworkError.retrievalError(underlayingError: error, response: urlResponse)
                let result = Result<T, NetworkError>.failure(clientError)
                completion(result)
                
                return
            }
            
            if let httpResponse = urlResponse as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if 200..<300 ~= statusCode {
                    let data = data ?? Data()
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        let result = Result<T, NetworkError>.success(model)
                        completion(result)
                    } catch let decodeError {
                        let error = NetworkError.parsingError(underlayingError: decodeError)
                        let result = Result<T, NetworkError>.failure(error)
                        completion(result)
                    }
                } else {
                    let clientError = NetworkError.retrievalError(underlayingError: error, response: urlResponse)
                    let result = Result<T, NetworkError>.failure(clientError)
                    completion(result)
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Download
    
    public func download(urlRequest: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let task = session.downloadTask(with: urlRequest) { (fileLocationURL, urlResponse, error) in
            guard error == nil else {
                let clientError = NetworkError.retrievalError(underlayingError: error, response: urlResponse)
                let result = Result<Data, NetworkError>.failure(clientError)
                completion(result)
                
                return
            }
            
            if let httpResponse = urlResponse as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if 200..<300 ~= statusCode {
                    guard let fileLocationURL = fileLocationURL else {
                        let result = Result<Data, NetworkError>.failure(NetworkError.invalidData(underlayingError: error))
                        completion(result)
                        return
                    }
                    
                    do {
                        let data = try Data(contentsOf: fileLocationURL)
                        let result = Result<Data, NetworkError>.success(data)
                        completion(result)
                    } catch let error {
                        let result = Result<Data, NetworkError>.failure(NetworkError.invalidData(underlayingError: error))
                        completion(result)
                    }
                } else {
                    let clientError = NetworkError.retrievalError(underlayingError: error, response: urlResponse)
                    let result = Result<Data, NetworkError>.failure(clientError)
                    completion(result)
                }
            }
        }
        task.resume()
    }
}

public extension NetworkClient {
    static let defaultClient = NetworkClient(session: URLSession(configuration: .default))
}
