//
//  macOS_menu_barApp.swift
//  macOS-menu-bar
//
//  Created by Wills Liou on 7/5/21.
//

import SwiftUI

@main
struct macOS_menu_barApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject,NSApplicationDelegate{
    // Status Bar and popover
    var statusItem: NSStatusItem?
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        // Menu View
        let menuView = MenuView()
        
        // PopOver
        popOver.behavior = .transient
        popOver.animates = true

        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        popOver.contentViewController?.view.window?.makeKey()
        
        // Status Bar
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Safe Check if status Button is Available or not...
        if let MenuButton = statusItem?.button{
            MenuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    
    // Button Action...
    @objc func MenuButtonToggle(sender: AnyObject){
        
        // Validation check
        if popOver.isShown{
            popOver.performClose(sender)
        }
        else{
            if let menuButton = statusItem?.button{
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
