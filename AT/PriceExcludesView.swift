//
//  PriceExcludesView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

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


class PriceExcludesView: UIView {
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let priceExcludesLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Price excludes"
        //        textView.backgroundColor = .clear
        return textView
    }()
    
    let priceExcludesTextView: UITextView = {
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
        addSubview(priceExcludesLabel)
        addSubview(priceExcludesTextView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        priceExcludesLabel <- [
            Top(5),
            Left(10),
            Right(0),
            Bottom(0).to(priceExcludesTextView),
            Height(15)
        ]
        priceExcludesTextView <- [
            Top(0).to(priceExcludesLabel),
            Left(5),
            Right(0),
            Bottom(0)
        ]
    }
}

