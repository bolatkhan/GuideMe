//
//  AttractionImagesCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import EasyPeasy

class AttractionImageCell: DatasourceCell {
    
    lazy var imgOverlay: UIView = {
        let overlay =  UIView()
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        return overlay
    }()
    lazy var cellBackgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "bao.jpg")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        return backgroundImageView
    }()
    
    lazy var tourName: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Kayindi Lakes"
        return label
    }()
    
    lazy var tourShortDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Type of meeting"
        return label
    }()

    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(cellBackgroundImageView)
        cellBackgroundImageView.addSubview(imgOverlay)
        cellBackgroundImageView.addSubview(tourName)
        cellBackgroundImageView.addSubview(tourShortDescription)
        cellBackgroundImageView <- [
            Edges(0)
        ]
        imgOverlay <- [
            Edges(0)
        ]
        
               tourName <- [
            Center()
        ]
        tourShortDescription <- [
            Bottom(5).to(tourName),
            CenterX()
        ]
    }
}