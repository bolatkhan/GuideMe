//
//  ToursAndActivitiesCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class ToursAndActivities: DatasourceCell {
    
    let tourImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Chartyn Canyon"
        label.backgroundColor = .green
        return label
    }()
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Eco Tour"
        label.backgroundColor = .purple
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(tourImageView)
        addSubview(nameLabel)
        addSubview(typeLabel)
        
        tourImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 90, heightConstant: 90)
        nameLabel.anchor(tourImageView.topAnchor, left: tourImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        typeLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        
    }
}
