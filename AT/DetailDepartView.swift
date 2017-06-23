//
//  DetailDepartView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/19/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents


class DetailsDepartView: UIView {
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let departLabel: UILabel = {
        let textView = UILabel()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Departs at"
        return textView
    }()
    
    let departTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "by appointment"
        textView.textAlignment = .right
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    func setupViews() {
        addSubview(departLabel)
        addSubview(departTextView)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        departLabel <- [
            Top(0),
            Left(10),
            Bottom(0),
            Right(0).to(departTextView)
        ]
        departTextView <- [
            Top(0),
            Left(0).to(departLabel),
            Right(10),
            Bottom(0)
        ]
    }
}
