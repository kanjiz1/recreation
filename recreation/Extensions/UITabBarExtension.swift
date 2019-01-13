//
//  UITabBarExtension.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/3/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit

extension UITabBar {
	var tabIconVCenterAdjustment: CGFloat {
		if #available(iOS 11.0, *) {
			return -floor(safeAreaInsets.bottom / 2)
		}
		
		return 0
	}
}
