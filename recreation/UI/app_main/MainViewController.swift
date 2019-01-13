//
//  MainViewController.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/12/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Rswift

enum MainTab: Int {
	case welcome
	case bibleStudy
	case liveStream
	case giving
	case more
}

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	
}
