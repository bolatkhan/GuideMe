//
//  OverviewTableViewCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 2/21/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy


class OverviewTableViewCell: UITableViewCell {
    
    static let identifier = "overviewCell"
    
    lazy var tourFullDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 14)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 10
        label.text = "Type of meeting"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        contentView.addSubview(tourFullDescription)
    }
    
    private func setupConstraints(){
        tourFullDescription <- [
           Left(10),
           Right(10)
        ]
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
