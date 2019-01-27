//
//  LiveStreamViewController.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/15/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class LiveStreamViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
    }

}

extension LiveStreamViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.previous_streams_cells.identifier, for: indexPath)
		
		if let cell = cell as? PreviousStreamsCells {
			cell.dateLabel.text = "Look at me"
			cell.titleLabel.text = "God is Able"
			cell.backgroundColor = UIColor.clear
		}
		
		return cell
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
}
