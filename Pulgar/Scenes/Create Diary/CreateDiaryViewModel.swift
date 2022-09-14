//
//  CreateDiaryViewModel.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import SwiftUI
import Combine

class CreateDiaryViewModel: ObservableObject {
    @Published var photos = [UIImage]()
    @Published var selectedPhoto = UIImage()
    @Published var openCameraRoll = false
    @Published var comments = ""
    @Published var date = ""
    @Published var area = ""
    @Published var category = ""
    @Published var tags = ""
    @Published var event = ""
    @Published var showAlertMessage: Bool = false
    @Published var message = ""
    @Published var checkIncludeInGallery = true
    @Published var linkToEvent = true
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private let createSiteDiaryUseCase: SiteDiaryUseCase
    
    private let imageSaver = ImageSaver()

    init(createSiteDiaryUseCase: SiteDiaryUseCase) {
        self.createSiteDiaryUseCase = createSiteDiaryUseCase
    }
    
    func createSiteDiary() {
        createSiteDiaryUseCase.save(siteDiary: toSiteDiary())
            .sink(receiveCompletion: { completion in
                   switch completion {
                   case .finished:
                       break
                   case .failure(let error):
                     print(error.localizedDescription)
                   }
               }, receiveValue: {[weak self] siteDiary in
                   guard let weakSelf = self else { return }
                   
                   if weakSelf.checkIncludeInGallery {
                       for photo in weakSelf.photos {
                           weakSelf.imageSaver.saveToGallery(uiImage: photo)
                       }
                   }
                   
                   DispatchQueue.main.async {
                       weakSelf.showAlertMessage = true
                       weakSelf.clearFields()
                       weakSelf.message = Constants.alertSaved
                   }
                   
               }).store(in: &cancellableSet)
    }
    
    private func toSiteDiary() -> SiteDiary {
        return SiteDiary(photos: photos.map { SitePhoto.init(base64: $0.toBase64()) },
                                   comments: comments,
                                   date: date,
                                   area: area,
                                   category: category,
                                   tag: tags,
                                   event: event)
    }
    
    private func clearFields() {
        photos.removeAll()
        comments = ""
        date = ""
        area = ""
        category = ""
        tags = ""
        event = ""
    }
    
}
