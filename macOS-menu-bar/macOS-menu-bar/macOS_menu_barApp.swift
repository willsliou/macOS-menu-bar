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
        }
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
    }

    
}


// Pop Over Menu
