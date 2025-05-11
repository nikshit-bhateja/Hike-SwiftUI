//
//  SettingsView.swift
//  Hike
//
//  Created by Nikk Bhateja on 11/05/25.
//

import SwiftUI

struct SettingsView: View {
    //MARK: PROPERTIES
    private let appIcons:[String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    var body: some View {
        List{
            //MARK: SECTION: HEADER
            Section {
                HStack{
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .colorGreenLight,
                            .colorGreenMedium,
                            .colorGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            //MARK: SECTION: ICONS
            Section(header: Text("Alternate App Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(appIcons.indices, id: \.self) { item in
                            Button{
                                UIApplication.shared.setAlternateIconName(appIcons[item]) { error in
                                    if (error != nil) {
                                        print("Failed request to set alternate icon \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Successfully set alternate icon!")
                                    }
                                }
                            } label: {
                                Image("\(appIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }//: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
                
            }
            .listRowSeparator(.hidden)
            
            
            //MARK: SECTION: ABOUT
            Section(
                header: Text("About the app"),
                footer: HStack{
                    Spacer()
                    
                    Text("Copyright © All right eserved.")
                    
                    Spacer()
            }
                    .padding(.vertical, 8 )
            ) {
                //MARK: Advanced Labeled Content
                CustomListRowView(rowLabel: "Appication",
                                  rowIcon: "apps.iphone",
                                  rowContent: "Hike",
                                  rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility",
                                  rowIcon: "info.circle",
                                  rowContent: "iOS",
                                  rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology",
                                  rowIcon: "swift",
                                  rowContent: "Swift",
                                  rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version",
                                  rowIcon: "gear",
                                  rowContent: "1.0",
                                  rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer",
                                  rowIcon: "ellipsis.curlybraces",
                                  rowContent: "Nikshit",
                                  rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer",
                                  rowIcon: "paintpalette",
                                  rowContent: "Nikshit",
                                  rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website",
                                  rowIcon: "globe",
                                  rowContent: nil,
                                  rowTintColor: .indigo,
                                  rowLinkLabel: "Credo Academy",
                                  rowLinkDestination: "https://credo.academy"
                )
                
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
