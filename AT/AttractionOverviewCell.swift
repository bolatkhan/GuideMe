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
    
    override var datasourceItem: Any?{
        didSet {
            guard let attraction = datasourceItem as? Overview else { return }
            tourDescription.text = attraction.tourDescription
        }
    }
    lazy var tourDescription: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.numberOfLines = 0
        textView.text = "Sorry, some error"
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


