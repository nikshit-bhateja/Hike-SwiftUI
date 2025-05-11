//
//  CustomCircleView.swift
//  Hike
//
//  Created by Nikk Bhateja on 10/05/25.
//

import SwiftUI

struct CustomCircleView: View {
    //MARK: PROPERTIES
    @State private var isAnimate: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.colorIndigoMedium,
                                 .colorSalmonLight],
                        startPoint: isAnimate ? .topLeading : .bottomLeading,
                        endPoint: isAnimate ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear{
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                        isAnimate.toggle()
                    }
                }
            
            MotionAnimationView()
        } //: ZStack
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
