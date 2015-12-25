//
//  NSObject_Extension.swift
//
//  Created by Kiet Nguyen on 12/24/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import Foundation
import AppKit

extension NSObject {
    
    class func pluginDidLoad(bundle: NSBundle) {
        let appName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? NSString
        if appName == "Xcode" {
        	if sharedPlugin == nil {
        		sharedPlugin = XYZPlugin(bundle: bundle)
        	}
        }
    }
    
    func xyz_initWithIcon(icon: AnyObject?, message: String, parentWindow: AnyObject, duration: Double) -> AnyObject? {
        if icon != nil && XYZTogglingHandler.isEnabled() && message.containsString("Succeeded") {
            let imageIcon = NSBundle(identifier: "com.kietnguyen.XYZPlugin")!.imageForResource(XYZFaceFactory.createFace())
            self.xyz_initWithIcon(imageIcon!, message: message, parentWindow: parentWindow, duration: duration)
            
            if self.isKindOfClass(NSPanel) {
                let panel = self as! NSPanel
                if panel.contentView!.isKindOfClass(NSVisualEffectView) {
                    let visualEffectView = panel.contentView as! NSVisualEffectView
                    visualEffectView.material = NSVisualEffectMaterial.Titlebar
                    imageIcon?.template = false
                }
            }
            
            return self
        }
        
        return self.xyz_initWithIcon(icon, message: message, parentWindow: parentWindow, duration: duration)
    }
}