//
//  MenuBar.swift
//  FlickrImage
//
//  Created by Gagandeep Singh on 11/7/16.
//  Copyright © 2016 Gagandeep Singh. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    //--------------------------------------------------------------------------------
    //MARK:
    //MARK: UI Elements
    //--------------------------------------------------------------------------------
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.navBar()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    //--------------------------------------------------------------------------------
    //MARK:
    //MARK: Constants
    //--------------------------------------------------------------------------------
    let cellId = "cellId"
    let imageNames = ["icon-feed", "icon-collection"]
    
    
    
    //--------------------------------------------------------------------------------
    //MARK: Variables
    //--------------------------------------------------------------------------------
    var splitView: FlickrPhotoSplitView?
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint!
    
    
    
    //--------------------------------------------------------------------------------
    //MARK:
    //MARK: Initializers
    //--------------------------------------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        collectionView.leftAnchor.constraint    (equalTo: leftAnchor)   .isActive = true
        collectionView.rightAnchor.constraint   (equalTo: rightAnchor)  .isActive = true
        collectionView.topAnchor.constraint     (equalTo: topAnchor)    .isActive = true
        collectionView.bottomAnchor.constraint  (equalTo: bottomAnchor) .isActive = true
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
        
        setupHorizontalBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //--------------------------------------------------------------------------------
    //MARK:
    //MARK: Setup Horizontal Bar
    //--------------------------------------------------------------------------------
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.menuBarTint().withAlphaComponent(0.8)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    
    //--------------------------------------------------------------------------------
    //MARK:
    //MARK: Helpers
    //--------------------------------------------------------------------------------
    func selectItem(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
    
    
    //--------------------------------------------------------------------------------
    //MARK:
    //MARK: Collection View Delegate & Data Source
    //--------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item!])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.darkGray()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MainScreen.Size.width / 2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        splitView?.scrollToIndex(index: indexPath.item!)
    }
    
}
