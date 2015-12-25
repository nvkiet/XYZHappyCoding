//
//  XYZTogglingHandler.swift
//  XYZPlugin
//
//  Created by Kiet Nguyen on 12/25/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import AppKit

class XYZTogglingHandler: NSObject {
    
    static let kEnablePluginKey = "com.kietnguyen.xyzplugin.enableplugin"
    
    class func setIsEnabled(enabled: Bool) {
        NSUserDefaults.standardUserDefaults().setBool(enabled, forKey: kEnablePluginKey)
    }
    
    class func isEnabled() -> Bool {
        return NSUserDefaults.standardUserDefaults().boolForKey(kEnablePluginKey)
    }
    
    class func toggleMenu() -> Int {
        setIsEnabled(!isEnabled())
        return isEnabled() ? NSOnState: NSOffState
    }
}
