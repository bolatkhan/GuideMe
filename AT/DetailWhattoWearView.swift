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


class DetailWhatToWearView: UIView {
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let wearLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "What to wear"
        //        textView.backgroundColor = .clear
        return textView
    }()
    let wearTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.avenirMedium(fontSize: 10)
        textView.textColor = .black
        textView.text = "Water, ecofees and other blah blah blah"
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    func setupViews() {
        addSubview(wearLabel)
        addSubview(wearTextView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        wearLabel <- [
            Top(5),
            Left(10),
            Right(0),
            Bottom(0).to(wearTextView),
            Height(15)
        ]
        wearTextView <- [
            Top(0).to(wearLabel),
            Left(5),
            Right(0),
            Bottom(0)
        ]
    }
}

