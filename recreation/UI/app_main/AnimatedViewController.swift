//
//  AnimatedViewController.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/13/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Rswift

class AnimatedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		
		Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
			self.present(R.storyboard.main.main()!, animated: true, completion: nil)
		}
	}
}
