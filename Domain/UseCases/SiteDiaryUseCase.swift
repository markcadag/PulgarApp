//
//  DiaryUseCase.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import Combine

public protocol SiteDiaryUseCase {
    func save(siteDiary: SiteDiary) -> AnyPublisher<SiteDiary, Error>
}
