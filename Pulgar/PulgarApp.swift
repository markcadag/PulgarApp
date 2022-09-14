//
//  PulgarApp.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import SwiftUI

@main
struct PulgarApp: App {

    var body: some Scene {
        WindowGroup {
            let viewModel = CreateDiaryViewModel(createSiteDiaryUseCase: NetworkUseCaseProvider().makeDiaryUseCase())
            CreateDiaryView(viewModel)
        }
    }
}
