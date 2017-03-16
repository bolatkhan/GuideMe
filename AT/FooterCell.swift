//
//  FooterCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/16/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//


import LBTAComponents
import EasyPeasy



class FooterCell: DatasourceCell {
    
    
    override func setupViews() {
        super.setupViews()
        
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        
        addSubview(whiteBackgroundView)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
