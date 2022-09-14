//
//  CardTitleView.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import SwiftUI

struct CardTitleViewModel {
    var title: String
    var hasCheckBox: Bool
}

struct CardTitleView: View {
    
    let viewModel: CardTitleViewModel
    
    @EnvironmentObject var createSiteDiary: CreateDiaryViewModel
    
    init(cardTitleViewModel: CardTitleViewModel) {
        self.viewModel = cardTitleViewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title)
                    .font(Font.body.bold())
                    .foregroundColor(Color("gray"))
                Spacer()
                if viewModel.hasCheckBox {
                    Toggle("", isOn: $createSiteDiary.linkToEvent)
                      .toggleStyle(CheckboxToggleStyle(style: .square))
                      .foregroundColor(Color("neonGreen"))
                }
            }
            Divider()
                .padding([.top, .bottom], 6)
        }
    }
}

struct CardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CardTitleView(cardTitleViewModel: CardTitleViewModel(title: "Sample", hasCheckBox: true))
    }
}
