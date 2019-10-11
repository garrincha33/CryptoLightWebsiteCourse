//
//  ConstraintsAnchor.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 11/10/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let top = top else {return}
        topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        
        guard let left = left else {return}
        leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        
        guard let right = right else {return}
        rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
