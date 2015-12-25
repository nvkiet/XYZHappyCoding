//
//  XYZFaceFactory.swift
//  XYZPlugin
//
//  Created by Kiet Nguyen on 12/25/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import AppKit

class XYZFaceFactory: NSObject {
    
    static let faceNames = ["image0", "image1", "image2", "image3", "image4"]
    
    class func createFace() -> String {
        let index = Int(arc4random_uniform(UInt32(faceNames.count)))
        return faceNames[index]
    }
}
