//
//  CustomListRowView.swift
//  Hike
//
//  Created by Nikk Bhateja on 11/05/25.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination : String? = nil
    
    var body: some View {
        LabeledContent {
            
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil) && (rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }else {
                EmptyView()
            }
        } label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Appication",
                          rowIcon: "apps.iphone",
                          rowContent: "Hike",
                          rowTintColor: .blue)
    }
    
    
}
