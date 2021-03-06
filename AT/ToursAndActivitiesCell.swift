//
//  ToursAndActivitiesCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import EasyPeasy


class ToursAndActivities: DatasourceCell {
    var staticURL = "http://108.61.179.192/"
    override var datasourceItem: Any?{
        didSet {
            guard let tour = datasourceItem as? Tour else { return }
            tourImageView.loadImage(urlString: staticURL+(tour.tourImageUrls?[0])!)
            nameLabel.text = tour.name
            durationLabel.text = String(describing: tour.duration) + " hours"
            costLabel.text = "$"+String(describing: tour.price)
        }
    }
    let tourImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorry, there is no tours yet"
        label.font = UIFont.avenirMedium(fontSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "2 hours"
        label.font = UIFont.avenirMedium(fontSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    let costLabel: UILabel = {
        let label = UILabel()
        label.text = "$0"
        label.font = UIFont.avenirMedium(fontSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        addSubview(tourImageView)
        addSubview(nameLabel)
        addSubview(ratingLabel)
        addSubview(durationLabel)
        addSubview(costLabel)
        
        tourImageView <- [
            Size(104),
            Top(12),
            Right(8).to(nameLabel),
            Left(12)
        ]
        nameLabel <- [
            Top(12),
            Right(12),
            Left(8).to(tourImageView),
        ]
        durationLabel <- [
            Top(8).to(nameLabel),
            Right(12),
            Left(8).to(tourImageView)
        ]
        costLabel <- [
            Top(8).to(durationLabel),
            Right(12),
            Left(8).to(tourImageView)
        ]
     }
}
