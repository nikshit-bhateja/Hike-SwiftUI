//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Nikk Bhateja on 10/05/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //MARK: 3. DEPTH EFFECT
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            //MARK: 2. LIGHT BORDER LINE AT BOTTOM
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y: 2)
                 .opacity(0.85)
            
            //MARK: 1. SURFACE
            LinearGradient(
                colors: [.colorGreenLight,
                         .colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
