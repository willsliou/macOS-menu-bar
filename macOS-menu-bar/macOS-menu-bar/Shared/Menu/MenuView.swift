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
                TabButton(title: "Help", currentTab: $currentTab)
                TabButton(title: "Uploads", currentTab: $currentTab)
            }
        }
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
                    
                    } // ZStack
                ) // background
        } // Button Label bracket
        ) // Button parentheses
    } // var body some View
} // struct
