//
//  ButtonModifier.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import SwiftUI

struct ButtonDefault: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 20)
            .background(Color("neonGreen"))
            .foregroundColor(.white)
            .font(Font.body.bold())
            .cornerRadius(8)
    }
}
