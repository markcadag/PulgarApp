//
//  CardView.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import SwiftUI

struct CardViewModel {
    var title: String
    var withCheckMark: Bool = false
}

struct CardView<Content: View, TitleContent: View>:  View {
    var content: Content
    var titleContent: TitleContent
    var cardViewModel: CardViewModel
    
    init(content: Content, titleContent: TitleContent, cardViewModel: CardViewModel) {
        self.content = content
        self.titleContent = titleContent
        self.cardViewModel = cardViewModel
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 3)
            VStack {
                titleContent
                content
                    .padding(.bottom, 8)
            }.padding()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView.init(content: Text("Hello"), titleContent: Text("Hello"), cardViewModel: .init(title: "Hello"))
    }
}
