//
//  XYZSwizzleHandler.swift
//  XYZPlugin
//
//  Created by Kiet Nguyen on 12/25/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import AppKit

class XYZSwizzleHandler: NSObject {
    
    class func swizzle() {
        guard let cls = NSClassFromString("DVTBezelAlertPanel") as? NSObject.Type else {
            return
        }
        
        do {
            try cls.jr_swizzleMethod("initWithIcon:message:parentWindow:duration:", withMethod: "xyz_initWithIcon:message:parentWindow:duration:")
        } catch {
            print("Error : can not swizzle!")
        }
    }
}
