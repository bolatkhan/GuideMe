//
//  PriceIncludesView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//


import UIKit
import EasyPeasy
import LBTAComponents


class PriceIncludesView: UIView {
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let priceIncludesLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Price includes"
        return textView
    }()
    let priceIncludesTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 10)
        textView.textColor = .black
        textView.text = "Water, ecofees and other blah blah blah"
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    func setupViews() {
        addSubview(priceIncludesLabel)
        addSubview(priceIncludesTextView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        priceIncludesLabel <- [
            Top(0),
            Left(10),
            Right(0),
            Bottom(0).to(priceIncludesTextView)
        ]
        priceIncludesTextView <- [
            Top(0).to(priceIncludesLabel),
            Left(5),
            Right(0),
            Bottom(0)
        ]
    }
}

