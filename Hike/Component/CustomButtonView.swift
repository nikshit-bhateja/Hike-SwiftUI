//
//  CustomButtonView.swift
//  Hike
//
//  Created by Nikk Bhateja on 10/05/25.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors:[
                            .white,
                            .colorGreenLight,
                            .colorGreenMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                )
            
            //MARK: STROKE
            Circle()
                .stroke(LinearGradient(
                    colors: [
                        .colorGrayLight,
                        .colorGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom),
                    lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 25))
                .foregroundStyle(LinearGradient(
                    colors: [
                        .colorGrayLight,
                        .colorGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom))
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    CustomButtonView()
        .padding()
}
