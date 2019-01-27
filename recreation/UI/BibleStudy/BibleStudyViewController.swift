//
//  BibleStudyViewController.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/15/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class BibleStudyViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var page: Int!
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		
		page = 0
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let button = UIBarButtonItem()
		button.title = ""
		navigationItem.leftBarButtonItem = button
	}
	
	@IBAction func switchTableViews(_ sender: UISegmentedControl) {
		page = sender.selectedSegmentIndex
		tableView.reloadData()
	}
	
	
}

// MARK: - TableView Protocols

extension BibleStudyViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell: UITableViewCell
		
		cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bible_cell.identifier, for: indexPath)
		
		if let cell = cell as? BibleCell {
			cell.dayOfMonthLabel.text = "22"
			cell.monthLabel.text = "FEB"
			cell.dayOfWeekLabel.text = "Wednesday"
			cell.scripturesLabel.text = "Mark 11:23"
		}
		
		cell.backgroundColor = .clear
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: R.segue.bibleStudyViewController.showScriptures, sender: self)
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
}
