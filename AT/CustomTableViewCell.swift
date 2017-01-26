//
//  CustomTableViewCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 1/17/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.imageView?.image = UIImage()
        contentView.addSubview(imageView!)
        contentView.addSubview(textLabel!)
        textLabel?.textColor = .white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        textLabel?.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
    }
    
}
