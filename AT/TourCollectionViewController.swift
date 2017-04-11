//
//  TourCollectionViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/11/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents

class TourViewController: UIViewController {

    var tour: Tour?
    
    let tourImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorry, there is no tours yet"
        label.font = UIFont.avenirMedium(fontSize: 32)
        return label
    }()
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Almaty Region, Kazakhstan"
        label.font = UIFont.avenirMedium(fontSize: 24)
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "*****"
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    let costLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()

    
    private func setupViews() {
        self.title = "Detail Overview"
        view.addSubview(tourImageView)
        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(ratingLabel)
        view.addSubview(distanceLabel)
        view.addSubview(durationLabel)
        view.addSubview(costLabel)
    }
    private func setupConstraints(){
        tourImageView <- [
            Height(200),
            Top(64),
            Right(0),
            Left(0)
        ]
        
        nameLabel <- [
            Height(32),
            Top(274),
            Right(20),
            Left(20)
        ]
        
        typeLabel <- [
            Height(28),
            Top(8).to(nameLabel),
            Right(20),
            Left(20)
        ]
        ratingLabel <- [
            Height(20),
            Top(12).to(typeLabel),
            Right(20),
            Left(20)
        ]

        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nameLabel.text = tour?.name
        tourImageView.loadImage(urlString: "http://karibay.pythonanywhere.com/"+(tour?.tourImageUrl)!)
        setupViews()
        setupConstraints()

    }
    
}
