//
//  HeaderCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/16/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import EasyPeasy

class HeaderCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet {
            guard let title = datasourceItem as? Titles else { return }
            titleLabel.text = title.titleName
        }
    }
    var titleLabel: UILabel = {
        let labelView = UILabel()
        labelView.font = UIFont.avenirBold(fontSize: 18)
        labelView.textColor = .black
        labelView.text = "Overview"
        return labelView
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
