//
//  ViewModelType.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
