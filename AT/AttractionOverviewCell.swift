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
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 14)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Some description Some descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome descriptionSome description"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(tourDescription)
       
        tourDescription <- [
            Edges(0)
        ]
    }
}


