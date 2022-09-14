//
//  PhotosRowView.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import SwiftUI

struct PhotosRowView: View {
    
    private let viewModel: PhotoItemViewModel
    
    init(viewModel: PhotoItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .padding(8)
                
                    Image("cancel")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
            }
        }
    }
}
