//
//  AttractionReviewsCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class ReviewCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "me")
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Askhat Bolatkhan"
        return label
    }()
    
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "*****"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "March 2017"
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text Some text Some text Some text Some textSome text Some textSome text"
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(ratingLabel)
        addSubview(dateLabel)
        addSubview(reviewLabel)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 70)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        ratingLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        dateLabel.anchor(nameLabel.bottomAnchor, left: ratingLabel.rightAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        reviewLabel.anchor(profileImageView.bottomAnchor, left: profileImageView.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
       
        
        
        
        
        
    }
}
