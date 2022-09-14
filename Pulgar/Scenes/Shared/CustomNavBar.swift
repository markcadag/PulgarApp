//
//  CustomNavBar.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import SwiftUI

struct CustomNavBar<Content>: View where Content: View {
    let title: String
    let content: Content
    
    var body: some View {
            NavigationView {
                ZStack {
                    content
                        .padding(.top, 40)
                    VStack {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(.black)
                            HStack {
                                Image("close")
                                    .resizable()
                                    .frame(width: 13    , height: 13)
                                    .foregroundColor(.white)
                                    
                                Text("New Diary")
                                    .foregroundColor(.white)
                                    .padding(.leading, 20)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }.padding([.top, .leading], 16)
                        }.frame(height: 90)
                        .edgesIgnoringSafeArea(.all)
                        Spacer()
                    }
                    
                }
                .navigationBarTitle(title, displayMode: .inline)
                .navigationTitle("")
                .navigationBarHidden(true)
                .navigationViewStyle(.stack)
            }
        }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(title: "Sample", content: Text("Okay"))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
