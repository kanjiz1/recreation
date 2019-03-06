//
//  WelcomeViewController.swift
//  recreation
//
//  Created by Oforkanji Odekpe on 1/15/19.
//  Copyright © 2019 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
							UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var pageControl: UIPageControl!
	@IBOutlet weak var welcomeCollectionView: UICollectionView!
	
	var slideshowPages: [SlideshowPages] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		welcomeCollectionView.delegate = self
		welcomeCollectionView.dataSource = self
		welcomeCollectionView.isPagingEnabled = true
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		slideshowPages = [SlideshowPages(title: "National Convention", message: "We are expecting you"),
						SlideshowPages(title: "2019", message: "My Year Of Fruitfulness & Success"),
						SlideshowPages(title: "8th Annual Convention", message: "None shall be barren"),
						SlideshowPages(title: "Events", message: "Stay up to date with our upcoming events")]
	}
	
	func setupWelcomeCollectionViewCell(cell: WelcomeCollectionViewCell, indexPath: IndexPath, backgroundColor: UIColor) {
		cell.background.backgroundColor = backgroundColor
		cell.titleLabel.text = slideshowPages[indexPath.row].title
		cell.messageLabel.text = slideshowPages[indexPath.row].message
	}
	
}

extension WelcomeViewController {
	
	//MARK: - CollectionView Delegate Methods
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return slideshowPages.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: UICollectionViewCell
		
		cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.welcomeCollectionViewCell.identifier, for: indexPath)
		
		if let cell = cell as? WelcomeCollectionViewCell {
			setupWelcomeCollectionViewCell(cell: cell, indexPath: indexPath, backgroundColor: R.color.lightSkyblue()!)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}
