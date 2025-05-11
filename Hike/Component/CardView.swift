//
//  CardView.swift
//  Hike
//
//  Created by Nikk Bhateja on 10/05/25.
//

import SwiftUI

struct CardView: View {
    //MARK: PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: METHODS
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        //MARK: CARD VIEW
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: HEADER
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("HIKING")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.colorGrayLight,
                                             .colorGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button {
                            print("Hiking button was tapped")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                        
                    }
                    
                    Text("Fun and Enjoyable outdoor factivity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(.colorGrayMedium)
                }//: HEADER
                .padding(.horizontal, 30)
                
                //MARK: MAIN CONTENT
                ZStack{
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeInOut(duration: 0.5), value: imageNumber)
                    
                } //: MAIN CONTENT
                
                //MARK: FOOTER VIEW
                Button {
                    // ACTION: show sheet from here
                    print("The button was pressed")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .colorGreenLight,
                                    .colorGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButtonStyle())
                
            }
            
        } //: CARD VIEW
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
