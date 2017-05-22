//
//  MainDescriptionView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/17/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents
import Device

class MainDescriptionView: UIView {
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let tourImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorry, there is no tours yet"
        label.font = UIFont.avenirMedium(fontSize: 18)
        label.numberOfLines = 0
        return label
    }()
    let tourType: UILabel = {
        let label = UILabel()
        label.text = "Nature&Mountains"
        label.font = UIFont.avenirMedium(fontSize: 14)
        return label
    }()
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    let peopleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "people")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let durationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "duration")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let peopleLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        return label
    }()
    let peopleText: UILabel = {
        let label = UILabel()
        label.text = "человек"
        return label
    }()
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        return label
    }()
       func setupViews() {
        addSubview(tourImageView)
        addSubview(nameLabel)
        addSubview(tourType)
        addSubview(ratingLabel)
        
        addSubview(peopleImage)
        addSubview(peopleLabel)
        addSubview(peopleText)
        
        addSubview(durationImage)
        addSubview(durationLabel)
        setupConstraints()
        
        backgroundColor = .white
    }
    private func setupConstraints(){
        tourImageView <- [
            Height(200),
            Top(),
            Right(0),
            Left(0)
        ]
        nameLabel <- [
            Top(8).to(tourImageView),
            Right(10),
            Left(10)
        ]
        tourType <- [
            Top(0).to(nameLabel),
            Right(10),
            Left(10)
        ]
        ratingLabel <- [
            Top(8).to(tourType),
            Right(10),
            Left(10)
        ]
        peopleImage <- [
            Height(50),
            Width(80),
            Top(12).to(ratingLabel),
            CenterX(-69.0)
        ]
        peopleLabel <- [
            Top(6).to(peopleImage),
            CenterX(-100.0)
        ]
        peopleText <- [
            Top(6).to(peopleImage),
            Left(6).to(peopleLabel)
        ]
        durationImage <- [
            Size(50),
            Top(12).to(ratingLabel),
            CenterX(69.0)
        ]
        durationLabel <- [
            Top(6).to(durationImage),
            CenterX(69.0)
        ]
    }
}
