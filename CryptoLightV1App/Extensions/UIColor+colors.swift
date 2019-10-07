//
//  UIColor+colors.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 31/07/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
