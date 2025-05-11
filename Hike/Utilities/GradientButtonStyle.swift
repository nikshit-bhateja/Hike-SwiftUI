//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Nikk Bhateja on 10/05/25.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.colorGrayMedium, .colorGrayLight], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}

