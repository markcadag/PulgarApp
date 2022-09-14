//
//  SiteDiaryUseCase.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import Combine


final class NetworkSiteDiaryUseCase: SiteDiaryUseCase {
    
    private let siteDiaryService: SiteDiaryService
    
    init(siteDiaryService: SiteDiaryService) {
        self.siteDiaryService = siteDiaryService
    }
    
    func save(siteDiary: SiteDiary) -> AnyPublisher<SiteDiary, Error> {
        return siteDiaryService
            .save(siteDiary)
    }
}
