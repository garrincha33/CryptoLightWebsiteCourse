//
//  String+truncate.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 09/10/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import Foundation

extension String {
    //truncates the string to specified length of characters
    func trunc(length: Int) -> String {
        return (self.count > length) ? String(self.prefix(length)) : self
    }
}
