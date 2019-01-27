//
//  BibleCell.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/26/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class BibleCell: UITableViewCell {

	@IBOutlet weak var monthLabel: UILabel!
	@IBOutlet weak var dayOfMonthLabel: UILabel!
	@IBOutlet weak var dayOfWeekLabel: UILabel!
	@IBOutlet weak var scripturesLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
