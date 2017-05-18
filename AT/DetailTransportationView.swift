//
//  DetailTransportationView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents


class DetailTransportationView: UIView {
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    let transportationLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Transportation"
        //        textView.backgroundColor = .clear
        return textView
    }()
    
    let transportationTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Car, Walking"
        textView.textAlignment = .right
        //        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false

        return textView
    }()
    
    
    func setupViews() {
        addSubview(transportationLabel)
        addSubview(transportationTextView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        transportationLabel <- [
            Top(0),
            Left(10),
            Bottom(0),
            Right(0).to(transportationTextView)
        ]
        transportationTextView <- [
            Top(0),
            Left(0).to(transportationLabel),
            Right(10),
            Bottom(0)
        ]
    }
    
}

