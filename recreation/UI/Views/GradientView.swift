//
//  GradientView.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/3/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import CoreGraphics

public class GradientView: UIView {
	
	static let alphaSCurve = [0.00, 0.01, 0.05, 0.14, 0.30, 0.50, 0.70, 0.86, 0.95, 0.99, 1.00]
	class func gradientSCurveFromTransparentToColor(_ c: UIColor) -> [UIColor] {
		return alphaSCurve.map {
			c.withAlphaComponent(CGFloat($0))
		}
	}
	
	override public class var layerClass: AnyClass {
		return CAGradientLayer.self
	}
	
	@IBInspectable public var firstColor: UIColor {
		get { return self.colors.first ?? .clear }
		set {
			if colors.count > 0 {
				var newColors = colors
				newColors[0] = newValue
				colors = newColors
			}
			else {
				colors = [newValue, newValue]
			}
		}
	}
	
	@IBInspectable public var lastColor: UIColor {
		get { return self.colors.last ?? .clear }
		set {
			if colors.count > 0 {
				var newColors = colors
				newColors[colors.count - 1] = newValue
				colors = newColors
			}
			else {
				colors = [newValue, newValue]
			}
		}
	}
	
	public var gradientLayer: CAGradientLayer {
		get { return layer as! CAGradientLayer }
	}
	
	public var colors = [UIColor]() {
		didSet { gradientLayer.colors = colors.map { $0.cgColor } }
	}
	
	public var locations = [CGFloat]() {
		didSet { gradientLayer.locations = locations as [NSNumber] }
	}
	
	public var colorMap: [CGFloat: UIColor] {
		get {
			var map = [CGFloat:UIColor]()
			for i in 0 ..< locations.count {
				map[locations[i]] = colors[i]
			}
			return  map
		}
		
		set {
			let arr = newValue.map { $0 }.sorted { $0.0 < $1.0 }
			gradientLayer.locations = arr.map { NSNumber(value: Float($0.0) as Float) }
			gradientLayer.colors = arr.map { $0.1.cgColor }
		}
	}
	
	public var startPoint: CGPoint {
		get { return gradientLayer.startPoint }
		set { gradientLayer.startPoint = newValue }
	}
	
	public var endPoint: CGPoint {
		get { return gradientLayer.endPoint }
		set { gradientLayer.endPoint = newValue }
	}
}
