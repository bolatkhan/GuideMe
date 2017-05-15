//
//  DetailsView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//
import UIKit
import EasyPeasy
import LBTAComponents


class DetailsPriceView: UIView {
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    let priceLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Price per person"
        return textView
    }()
    
    let priceView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "$30"
        textView.textAlignment = .right
        textView.isEditable = false
        return textView
    }()


    func setupViews() {
        addSubview(priceLabel)
        addSubview(priceView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
         priceLabel <- [
            Top(0),
            Left(10),
            Bottom(0),
            Right(0).to(priceView)
                    ]
        priceView <- [
           Top(0),
           Left(0).to(priceLabel),
           Right(10),
           Bottom(0)
        ]
    }
    
}
