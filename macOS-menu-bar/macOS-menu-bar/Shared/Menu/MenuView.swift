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
                .padding(25)
                .frame(width: 100, height:100)
            
            // Text and Buttons for Image
            HStack{
                // Text
                Text("Share")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                // Button Object for Sharing Icon
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName:
                        "square.and.arrow.up")
                        .foregroundColor(.primary)
                    } // Button label paranthesis
                    )//Button paranthesis
                    
            }
            // https://developer.apple.com/documentation/swiftui/spacer
            Spacer(minLength: 0)
        }
        // Bottom divider
//        Divider()
//            .padding(.bottom, 2)

            
        // Bottom View
        HStack {
            
            // Insert and resize image
            Image("poseidon")
                .resizable()
                .aspectRatio(contentMode:. fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text("Poseidon")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Spacer(minLength: 0)
            
            // Button object
            Button(action: {}, label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.primary)
            } // Button label bracket
            ) // Button paranthesis
            buttonStyle(PlainButtonStyle())
        }
        //Add paddding on bottom
        .padding(.horizontal)
        .padding(.vertical)
        
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
                                .stroke(Color.primary, lineWidth: 0.6)
                        }
                        
                        
                    } // ZStack
                ) // background
        } // Button Label bracket
        ) // Button parentheses
        .buttonStyle(PlainButtonStyle())
    } // var body some View
} // struct
