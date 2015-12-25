//
//  XYZPlugin.swift
//
//  Created by Kiet Nguyen on 12/24/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import AppKit

var sharedPlugin: XYZPlugin?

class XYZPlugin: NSObject {

    var bundle: NSBundle
    let menuHandler = XYZMenuHandler()
    
    init(bundle: NSBundle) {
        self.bundle = bundle
        super.init()
        XYZTogglingHandler.setIsEnabled(true)
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken) {
            XYZSwizzleHandler.swizzle()
        }
    }
}

