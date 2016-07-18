//
//  FlickrPhotoCollectionViewCell.swift
//  FlickrSpike
//
//  Created by Gagandeep Singh on 18/7/16.
//  Copyright © 2016 Gagandeep Singh. All rights reserved.
//

import UIKit


class FlickrPhotoCollectionViewCell: BaseCollectionCell {
    
    //MARK: Data
    var flickrPhoto: FlickrPhoto? {
        didSet {
            if let urlString = flickrPhoto?.imageUrl {
                if photoView.image == nil {
                    photoView.loadImageUsingCache(withUrlString: urlString)
                }
            }
        }
    }
    
    //MARK: Views
    let photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect.zero)
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.contentMode = .scaleAspectFill
        pv.clipsToBounds = true
        return pv
    }()
    
    override func setupViews() {
        
        photoView.removeFromSuperview()
        
        addSubview(photoView)
        photoView.topAnchor.constraint      (equalTo: topAnchor)    .isActive = true
        photoView.bottomAnchor.constraint   (equalTo: bottomAnchor) .isActive = true
        photoView.leftAnchor.constraint     (equalTo: leftAnchor)   .isActive = true
        photoView.rightAnchor.constraint    (equalTo: rightAnchor)  .isActive = true
        
    }
    
}