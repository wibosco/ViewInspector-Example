//
//  MovieError.swift
//  MovieRepository
//
//  Created by William Boles on 25/11/2021.
//

import Foundation

public enum MovieError: Error {
    case retrivalError(underlayingError: Error?)
}
