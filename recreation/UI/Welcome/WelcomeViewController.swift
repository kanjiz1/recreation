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
	weak var timer: Timer?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		welcomeCollectionView.delegate = self
		welcomeCollectionView.dataSource = self
		welcomeCollectionView.isPagingEnabled = true
		welcomeCollectionView.showsHorizontalScrollIndicator = false
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupSlideshowItems()
		startSlideshow()
		pageControl.currentPage = 0
		pageControl.numberOfPages = slideshowPages.count
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		timer?.invalidate()
		timer = nil
	}
	
	func startSlideshow() {
		let startOver = Int(pageControl.currentPage + 1) == slideshowPages.count
		timer?.invalidate()
		timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
			if startOver {
				self?.startOver()
			} else {
				self?.handleNext()
			}
		}
	}
	
	func setupSlideshowItems() {
		slideshowPages = [SlideshowPages(title: "National Convention", message: "We are expecting you"),
						  SlideshowPages(title: "2019", message: "My Year Of Fruitfulness & Success"),
						  SlideshowPages(title: "8th Annual Convention", message: "None shall be barren"),
						  SlideshowPages(title: "Events", message: "Stay up to date with our upcoming events")]
	}
	
	@objc func handleNext() {
		let nextIndex = min(pageControl.currentPage + 1, slideshowPages.count - 1)
		let indexPath = IndexPath(item: nextIndex, section: 0)
		pageControl.currentPage = nextIndex
		welcomeCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
	
	@objc func handlePrev() {
		let nextIndex = max(pageControl.currentPage - 1, 0)
		let indexPath = IndexPath(item: nextIndex, section: 0)
		pageControl.currentPage = nextIndex
		welcomeCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
	
	@objc func startOver() {
		let startIndex = 0
		let indexPath = IndexPath(row: 0, section: 0)
		pageControl.currentPage = startIndex
		welcomeCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
	
}

extension WelcomeViewController {
	
	func setupWelcomeCollectionViewCell(cell: WelcomeCollectionViewCell, indexPath: IndexPath, backgroundColor: UIColor) {
		cell.background.backgroundColor = backgroundColor
		cell.titleLabel.text = slideshowPages[indexPath.row].title
		cell.messageLabel.text = slideshowPages[indexPath.row].message
	}
	
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
	
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		
		let x = targetContentOffset.pointee.x
		pageControl.currentPage = Int(x / view.frame.width)
	}
}
