//
//  HexColorConverter.swift
//  QRecipes
//
//  Created by Yiheng Cen Feng on 10/3/20.
//  Copyright © 2020 Kyo. All rights reserved.
//

import UIKit


extension UIColor {
    convenience init(rgb: UInt) {
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}
