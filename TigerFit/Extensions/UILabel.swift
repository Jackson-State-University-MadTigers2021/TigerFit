//
//  UILabel.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/25/21.
//

import UIKit

extension UILabel {
    func Spacing(spacing: CGFloat) {
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
        self.attributedText = attributedStr
    }
}
