//
//  DetailReviewView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//


import UIKit
import EasyPeasy
import LBTAComponents


class DetailReviewView: UIView {
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    let reviewLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Reviews"
        //        textView.backgroundColor = .clear
        return textView
    }()
    
    let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "*****"
        textView.textAlignment = .right
        textView.backgroundColor = .clear
        textView.isEditable = false
        return textView
    }()
    
    
    func setupViews() {
        addSubview(reviewLabel)
        addSubview(reviewTextView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        reviewLabel <- [
            Top(0),
            Left(10),
            Bottom(0),
            Right(0).to(reviewTextView)
        ]
        reviewTextView <- [
            Top(0),
            Left(0).to(reviewLabel),
            Right(10),
            Bottom(0)
        ]
    }
    
}

