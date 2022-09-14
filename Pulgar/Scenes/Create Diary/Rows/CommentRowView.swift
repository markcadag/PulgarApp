//
//  Comments.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import SwiftUI

struct CommentRowView: View  {
    
    @State var email = ""
    
    @EnvironmentObject var createDiaryViewModel: CreateDiaryViewModel
    
    var titleView: some View {
        CardTitleView(cardTitleViewModel: CardTitleViewModel(title: Constants.titleComments,
                                                             hasCheckBox: false))
    }
    
    var mainView: some View {
        TextField(Constants.titleComments, text: $createDiaryViewModel.comments)
            .modifier(TextFieldDefault())
            .padding(.bottom, 18)
    }
    
    var body: some View {
        CardView.init(content: mainView,
                    titleContent: titleView,
                    cardViewModel: .init(title: Constants.titleComments))
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRowView()
    }
}


