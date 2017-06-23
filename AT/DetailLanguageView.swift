//
//  DetailLanguageView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents


class DetailLanguageView: UIView {
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let languageLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Languages"
        return textView
    }()
    
    let languageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "English, Russian"
        textView.textAlignment = .right
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    func setupViews() {
        addSubview(languageLabel)
        addSubview(languageTextView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        languageLabel <- [
            Top(0),
            Left(10),
            Bottom(0),
            Right(0).to(languageTextView)
        ]
        languageTextView <- [
            Top(0),
            Left(0).to(languageLabel),
            Right(10),
            Bottom(0)
        ]
    }
}

