//
//  Repository.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import Combine

protocol CombineRepository {
    associatedtype T
    func save(_ item: T) -> AnyPublisher<T, Error>
}
