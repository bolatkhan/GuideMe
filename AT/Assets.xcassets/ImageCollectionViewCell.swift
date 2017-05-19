//
//  ImageCollectionViewCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 5/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import Reusable
import EasyPeasy

class ImageCollectionViewCell: UICollectionViewCell, Reusable {
    var imageView = UIImageView()
    
    lazy var imgOverlay: UIView = {
        let overlay =  UIView()
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        return overlay
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        imageView.addSubview(imgOverlay)
        imageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
        imgOverlay.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
    }
}
