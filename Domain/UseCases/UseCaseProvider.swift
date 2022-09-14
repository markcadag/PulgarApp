//
//  UseCaseProvider.swift
//  Pulgar
//
//  Created by iOS Developer on 9/13/22.
//

import Foundation


import Foundation

public protocol UseCaseProvider {
    func makeDiaryUseCase() -> SiteDiaryUseCase
}
