//
//  macOS_menu_barApp.swift
//  macOS-menu-bar
//
//  Created by Wills Liou on 7/5/21.
//

import SwiftUI

@main
struct macOS_menu_barApp: App {
    // Connect App Delegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        } // WindowGroup
    }
}

// Menu Button
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // Status Bar Item
    var statusItem: NSStatusItem?
    // Popover
    var popOver = NSPopover()
        
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = MenuView()
        
        // create popover
        popOver.behavior = .transient
        popOver.animates = true
        // Setting Empty View Controller
        // https://developer.apple.com/documentation/appkit/nswindow/1419615-contentviewcontroller
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        // Status Bar Button
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        
        // Validation check if status button is avaliable
        if let MenuButton = statusItem?.button {
            
            // Set arrow image
            MenuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        } // if MenuButton bracket
    } // function application bracket
    
    
    // Button action
    @objc func MenuButtonToggle() {
        
        // Show popover
        if let menuButton = statusItem?.button {
            // Get button location for popover arrow
            self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
        } // if menuButton bracket
        
        
    } // function object bracket
    
    
    

    
    
} // class object
    
    
    
    


// Pop Over Menu
