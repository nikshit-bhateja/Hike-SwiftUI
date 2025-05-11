//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Nikk Bhateja on 10/05/25.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimate: Bool = false
    
    //MARK: METHODS
    
    // 1. RANDOM COORDINATE
    func randomCoooordinate() -> CGFloat { CGFloat.random(in: 0...256) }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat { CGFloat(Int.random(in: 4...80)) }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat { CGFloat.random(in: 0.1...2) }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double { Double.random(in: 0.05...1.0)}
    
    // 5. RANDOM DELAY
    func randomDelay() ->  Double { Double.random(in: 0...2) }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoooordinate(),
                        y: randomCoooordinate()
                    )
                    .scaleEffect(isAnimate ? randomScale() : 1)
                    .onAppear{
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25,
                                                 damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        )
                        { isAnimate.toggle() }
                    }
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack{
        Color.teal.ignoresSafeArea()
        
        MotionAnimationView()
    }
}
