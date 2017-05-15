//
//  File.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/17/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents


class AboutHostView: UIView {
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "About your host"
        label.font = UIFont.avenirMedium(fontSize: 24)
        return label
    }()
  
    let hostImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "me")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        return imageView
    }()
    let hostName: UILabel = {
        let label = UILabel()
        label.text = "Askhat Bolatkhan"
        label.font = UIFont.avenirMedium(fontSize: 18)
        return label
    }()
    let hostOverview: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "YourHost.com has been an important and valuable partner in extending our ministry reach through media streaming services, allowing us to take the gospel to the uttermost parts of the world. Using affordable turnkey streaming solutions, they have held our hand and helped us simplify YourHost.com has been an important and valuable partner in extending our ministry reach through media streaming services, allowing us to take the gospel to the uttermost parts of the world. Using affordable turnkey streaming solutions, they have held our hand and helped us simplifyYourHost.com has been an important and valuable partner in extending our ministry reach through media streaming services, allowing us to take the gospel to the uttermost parts of the world. Using affordable turnkey streaming solutions, they have held our hand and helped us simplify"
//        textView.backgroundColor = .clear
        textView.isEditable = false
        return textView
    }()
    
    
    func setupViews() {
        addSubview(headerLabel)
        addSubview(hostImage)
        addSubview(hostName)
        addSubview(hostOverview)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        headerLabel <- [
            Top(),
            Right(10),
            Left(10)
        ]
        hostImage <- [
            Size(70),
            Top(12).to(headerLabel),
            CenterX(0)
        ]
        hostName <- [
            Top(8).to(hostImage),
            CenterX(0)
        ]
        hostOverview <- [
            Top(8).to(hostName),
            Left(10),
            Right(10),
            Bottom(5),
            CenterX(0)
        ]
    }

}
