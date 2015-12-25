//
//  XYZMenuHandler.swift
//  XYZPlugin
//
//  Created by Kiet Nguyen on 12/25/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import AppKit

class XYZMenuHandler: NSObject {
    lazy var center = NSNotificationCenter.defaultCenter()
    
    override init() {
        super.init()
        center.addObserver(self, selector: Selector("createMenuItems"),
            name: NSApplicationDidFinishLaunchingNotification, object: nil)
    }
    
    deinit {
        removeObserver()
    }
    
    func removeObserver() {
        center.removeObserver(self)
    }
    
    func createMenuItems() {
        removeObserver()
        setup()
    }
    
    func setup() {
        guard let editMenuItem = NSApp.mainMenu!.itemWithTitle("Edit") else {
            return
        }
        
        let childMenuItem = NSMenuItem(title:"Happy Coding", action:nil, keyEquivalent:"")
        childMenuItem.enabled = true
        childMenuItem.submenu = NSMenu(title: childMenuItem.title)
        
        editMenuItem.submenu!.addItem(NSMenuItem.separatorItem())
        editMenuItem.submenu!.addItem(childMenuItem)
        
        let subChildMenuItem = NSMenuItem(title: "Enable",
            action: "subChildMenuItemAction:", keyEquivalent: "")
        subChildMenuItem.target = self
        subChildMenuItem.state = NSOnState
        childMenuItem.submenu?.addItem(subChildMenuItem)
    }
    
    func subChildMenuItemAction(menuItem: NSMenuItem) {
        menuItem.state = XYZTogglingHandler.toggleMenu()
    }
}
