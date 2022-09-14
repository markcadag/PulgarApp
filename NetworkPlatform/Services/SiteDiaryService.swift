//
//  Services.swift
//  Pulgar
//
//  Created by iOS Developer on 9/3/22.
//

import Foundation
import Combine

class SiteDiaryService: CombineRepository {
    typealias T = SiteDiary
    private let apiManager: APIManager<SiteDiary>
    
    init(apiManager: APIManager<SiteDiary>) {
        self.apiManager = apiManager
    }

    func save(_ item: SiteDiary) -> AnyPublisher<SiteDiary, Error> {
        apiManager.post(item)
     }
}
