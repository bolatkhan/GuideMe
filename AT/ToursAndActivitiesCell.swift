//
//  ToursAndActivitiesCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class ToursAndActivities: DatasourceCell {
    var staticURL = "http://karibay.pythonanywhere.com/"

    override var datasourceItem: Any?{
        didSet {
            guard let tour = datasourceItem as? Tour else { return }
            tourImageView.loadImage(urlString: staticURL+tour.tourImageUrlString)
            nameLabel.text = tour.name
            typeLabel.text = tour.typeName
            durationLabel.text = tour.duration
            costLabel.text = "$"+String(tour.pricePerPerson)
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
        label.backgroundColor = .clear
        return label
    }()
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Nature Landmarks"
        label.font = UIFont.avenirMedium(fontSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .clear
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
        addSubview(typeLabel)
        addSubview(ratingLabel)
        addSubview(durationLabel)
        addSubview(costLabel)
        
        tourImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 104, heightConstant: 104)
        nameLabel.anchor(tourImageView.topAnchor, left: tourImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        typeLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        ratingLabel.anchor(typeLabel.bottomAnchor, left: typeLabel.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        durationLabel.anchor(ratingLabel.bottomAnchor, left: ratingLabel.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 120, heightConstant: 20)
        costLabel.anchor(ratingLabel.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 18, widthConstant: 0, heightConstant: 25)
        
    }
}
