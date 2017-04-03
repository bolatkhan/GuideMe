//
//  ToursAndActivitiesCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class ToursAndActivities: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet {
            guard let tour = datasourceItem as? Tour else { return }
//            tourImageView.image = tour.tourImageUrl
            nameLabel.text = tour.name
            typeLabel.text = tour.type
            ratingLabel.text = tour.rating
            distanceLabel.text = tour.distance
            timeLabel.text = tour.time
        }
    }
    
    let tourImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = #imageLiteral(resourceName: "bao")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorry, there is no tours yet"
        return label
    }()
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let costLabel: UILabel = {
        let label = UILabel()
        label.text = ""
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
        addSubview(distanceLabel)
        addSubview(timeLabel)
        addSubview(costLabel)
      
        tourImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 104, heightConstant: 104)
        nameLabel.anchor(tourImageView.topAnchor, left: tourImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        typeLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        ratingLabel.anchor(typeLabel.bottomAnchor, left: typeLabel.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        distanceLabel.anchor(ratingLabel.bottomAnchor, left: ratingLabel.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 20)
        timeLabel.anchor(ratingLabel.bottomAnchor, left: distanceLabel.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        costLabel.anchor(ratingLabel.bottomAnchor, left: timeLabel.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 18, widthConstant: 0, heightConstant: 25)
        
        
        
        
        
        
    }
}
