//
//  UIViewControllerExtension.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/13/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//
import UIKit

extension UIViewController: UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> TimeInterval {
		return 2.5
	}
	
	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		
	}
}
