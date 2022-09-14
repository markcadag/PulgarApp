//
//  EventsView.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import SwiftUI

struct EventsItemView: View  {
    
    @EnvironmentObject var createDiaryViewModel: CreateDiaryViewModel
    
    var titleView: some View {
        let viewModel = CardTitleViewModel(title: Constants.titleLinkToExistingEvent,
                                          hasCheckBox: true)
        return CardTitleView(cardTitleViewModel: viewModel)
            .environmentObject(createDiaryViewModel)
  
    }
    
    var mainView: some View {
        TextField(Constants.placeHolderExistingEvent, text: $createDiaryViewModel.event)
            .modifier(TextFieldWithExpand())
            .padding(.bottom, 16)
            .disabled(!createDiaryViewModel.linkToEvent)
    }
    
    var body: some View {
        CardView.init(content: mainView,
                      titleContent: titleView,
                      cardViewModel: .init(title: Constants.titleLinkToExistingEvent))
    }
}

struct EventsItemView_Previews: PreviewProvider {
    static var previews: some View {
        EventsItemView()
    }
}
