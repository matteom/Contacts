//
//  UIView.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 26/01/2018.
//  Copyright © 2018 Matteo Manferdini. All rights reserved.
//

import UIKit

@IBDesignable class RoundImageView: UIImageView {}
@IBDesignable class RoundView: UIView {}

extension UIView {
	@IBInspectable
	var cornerRadius: CGFloat {
		get { return layer.cornerRadius }
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
	@IBInspectable
	var borderWidth: CGFloat {
		get { return layer.borderWidth }
		set { layer.borderWidth = newValue }
	}
	
	@IBInspectable
	var borderColor: UIColor? {
		get {
			guard let color = layer.borderColor else {
				return nil
			}
			return UIColor(cgColor: color)
		}
		set { layer.borderColor = newValue?.cgColor }
	}
}
