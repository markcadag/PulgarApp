//
//  Details.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import SwiftUI

struct DetailsItemView: View  {

    @EnvironmentObject var createDiaryViewModel: CreateDiaryViewModel
    
    var titleView: some View {
        CardTitleView(cardTitleViewModel: CardTitleViewModel(title: Constants.titleDetails,
                                                             hasCheckBox: false))
    }
    
    var mainView: some View {
        VStack() {
            TextField(Constants.placeHolderDate, text: $createDiaryViewModel.date)
                .modifier(TextFieldWithExpand())
                .padding(.bottom, 18)
            
            TextField(Constants.placeHolderArea, text: $createDiaryViewModel.area)
                .modifier(TextFieldWithExpand())
                .padding(.bottom, 18)
            
            TextField(Constants.placeHolderCategory, text: $createDiaryViewModel.category)
                .modifier(TextFieldWithExpand())
                .padding(.bottom, 18)
            
            TextField(Constants.placeHolderTags, text: $createDiaryViewModel.tags)
                .modifier(TextFieldDefault())
                .padding(.bottom, 18)
        }
    }
    
    var body: some View {
        CardView(content: mainView,
                 titleContent: titleView,
                 cardViewModel: CardViewModel(title: Constants.titleDetails))
    }
}

struct DetailsItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsItemView()
    }
}
