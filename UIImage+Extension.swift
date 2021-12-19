//
//  UIImage+Extension.swift
//  Phunware_CodeChallenge
//
//  Created by Reema Rachel Varghese on 12/18/21.
//

import Foundation
import UIKit
extension UIImage {
    
    func getCropRatio() -> CGFloat {
        var widthRatio = CGFloat(self.size.width/self.size.height)
        return widthRatio
    }
}
