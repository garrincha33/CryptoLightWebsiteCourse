//
//  UILable+MassLables.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 18/10/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(lines: Int, title: String, font: UIFont, alignment: NSTextAlignment, color: UIColor) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = lines
        self.text = title
        self.font = font
        self.textAlignment = alignment
        self.textColor = color
    }
}
