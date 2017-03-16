//
//  AttractionOverviewCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import EasyPeasy

class AttractionOverviewCell: DatasourceCell {
    
   
    
    lazy var tourDescription: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.numberOfLines = 0
        textView.text = "Some description Some descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptiondescription descriptiondescription description description description description description descriptiondescriptiondescriptiondescription descriptiondescription descriptiondescription descriptiondescriptiondescription descriptiondescriptiondescription descriptiondescription"
        textView.backgroundColor = .clear
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(tourDescription)
       
        tourDescription.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 12, rightConstant: 12, widthConstant: 0, heightConstant: 0)
    }
}


