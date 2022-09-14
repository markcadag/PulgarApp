//
//  NetworkUseCaseProvider.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation


struct NetworkUseCaseProvider: UseCaseProvider {
    let siteDiaryService = SiteDiaryService(apiManager: APIManager<SiteDiary>())
  
    public func makeDiaryUseCase() -> SiteDiaryUseCase {
        return NetworkSiteDiaryUseCase(siteDiaryService: siteDiaryService)
    }
}
