//
//  AppDelegate.swift
//  MenuBar
//
//  Created by 政 on 2017/10/4.
//  Copyright © 2017年 政. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu()
    let popover = NSPopover()
    var eventMonitor: EventMonitor?
    
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name(rawValue: "star"))
            button.action = #selector(AppDelegate.toggleWeather(sender:))
        }
        popover.contentViewController = WeatherViewController.loadFromNib()
        
        eventMonitor = EventMonitor(mask:[.leftMouseUp, .rightMouseUp], handler: {(event) -> () in
            if self.popover.isShown {
                self.closePopover(sender: event)//逃逸闭包里需要显示的用self
            }
        })
        
        
//        menu.addItem(NSMenuItem(title: "show weather", action: #selector(AppDelegate.showWeather(sender:)), keyEquivalent: "S"))
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(NSMenuItem(title: "quit", action: #selector(AppDelegate.showWeather(sender:)), keyEquivalent: "E"))
//        statusItem.menu = menu
        
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func showPopover(sender: Any) -> () {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
        eventMonitor?.start()
    }
    
    func closePopover(sender: Any) -> () {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    @objc func toggleWeather(sender: NSStatusBarButton) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
}

