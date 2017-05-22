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
    var signRight: UILabel = {
        let labelView = UILabel()
        labelView.font = UIFont.avenirBold(fontSize: 18)
        labelView.textColor = .black
        labelView.text = ">"
        return labelView
    }()
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(signRight)
        titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        signRight.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
    }
}
