//
//  RoundedTextfield.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/4/21.
//

import UIKit

class RoundedTextfield: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
    
    @IBInspectable var borderColor: UIColor = APP_THEME_COLOR {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }


     override open func textRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }

     override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }

     override open func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }
    
}
