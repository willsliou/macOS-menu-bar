// https://developer.apple.com/documentation/
//  MenuView.swift
//  macOS-menu-bar
//
//  Created by Wills Liou on 7/5/21.
//

import SwiftUI

struct MenuView: View {
    // Slide animation
    @Namespace var animation
    // Current Tab
    @State var currentTab = "Uploads"
    
    var body: some View {
        VStack {
            
            HStack {
                TabButton(title: "Help", currentTab: $currentTab, animation: animation)
                TabButton(title: "Uploads", currentTab: $currentTab, animation: animation)
            }
            // Add padding
            .padding(.horizontal)
            .padding(.top)
            
            // Divider
            Divider()
                .padding(.top, 5)
            
            // Adding image from Assets folder
            // https://www.simpleswiftguide.com/how-to-add-image-to-xcode-project-in-swiftui/
            Image("doge-money-icon")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode:. fit)
                .padding(3)
 
            // Bottom divider
            Divider()
                .padding(.bottom, 5)
            
            // https://developer.apple.com/documentation/swiftui/spacer
            Spacer(minLength: 0)
        }
        
        // Max Menu size
        .frame(width: 250, height: 500)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}


struct TabButton: View {
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {}, label: {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                // Dark Mode
                .foregroundColor(currentTab == title ? .white : .primary)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        
                        // If on currentTab, make rectangle blue
                        if currentTab == title {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                               // animation refers to variable defined in struct as Namespace.ID
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                        else {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary)
                        }
                        
                        
                    } // ZStack
                ) // background
        } // Button Label bracket
        ) // Button parentheses
        .buttonStyle(PlainButtonStyle())
    } // var body some View
} // struct
