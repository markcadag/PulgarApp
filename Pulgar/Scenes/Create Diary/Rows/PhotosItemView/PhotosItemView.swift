//
//  PhotosRowView.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation


import Foundation
import SwiftUI


struct PhotosItemView: View  {
    
    @EnvironmentObject var createDiaryViewModel: CreateDiaryViewModel
    
    var titleView: some View {
        CardTitleView(cardTitleViewModel: CardTitleViewModel(title: Constants.titleaddPhotosToSite,hasCheckBox: false))
    }

    var mainView: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(createDiaryViewModel.photos.map {
                        PhotoItemViewModel(image: $0)
                    }) { photo in
                        PhotosRowView(viewModel: photo)
                    }
                }
            }
           Button(action: {
               createDiaryViewModel.openCameraRoll = true
           }, label: {
               Text(Constants.takePhoto)
                   .foregroundColor(.white)
           }).buttonStyle(ButtonDefault())
            
            HStack {
                Text(Constants.includePhotoGallery)
                    .font(.system(size: 14))
                    .foregroundColor(Color("gray"))
                    .opacity(0.8)
                Spacer()
//                Image("checkbox")
//                    .frame(width: 20, height: 20)
//                    .foregroundColor(Color("neonGreen"))
//
                Toggle("", isOn: $createDiaryViewModel.checkIncludeInGallery)
                  .toggleStyle(CheckboxToggleStyle(style: .square))
                  .foregroundColor(Color("neonGreen"))
            }.padding(.top, 8)
                
        
        }
    }
    
    var body: some View {
        CardView(content: mainView,
                 titleContent: titleView,
                 cardViewModel: .init(title: Constants.titleaddPhotosToSite))
    }
}

struct PhotosItemView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosItemView()
    }
}
