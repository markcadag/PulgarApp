//
//  TitleModifier.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import SwiftUI

struct TextFieldDefault : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.top, 8)
            .font(.custom("Open Sans", size: 16))
            .overlay(
                VStack{
                    Divider().frame(height: 1)
                        .overlay(Color("gray"))
                        .opacity(0.5)
                        .offset(x: 0, y: 30)
                }
            )
    }
}

struct TextFieldWithExpand : ViewModifier {
    func body(content: Content) -> some View {
        content.modifier(TextFieldDefault())
            .overlay {
                VStack{
                    HStack {
                        Spacer()
                        Image("expand")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("gray").opacity(0.6))
                    }
                    
                }
            }
    }
}
