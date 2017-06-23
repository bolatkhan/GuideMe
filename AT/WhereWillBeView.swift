//
//  WhereWillBeView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/18/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents


class WhereWillBeView: UIView {
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "General info"
        label.font = UIFont.avenirMedium(fontSize: 24)
        return label
    }()
    let eventOverview: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "YourHost.com has been an important and valuable partner in extending our ministry reach through media streaming services, allowing us to take the gospel to the uttermost parts of the world. Using affordable turnkey streaming solutions, they have held our hand and helped us simplify"
        textView.isEditable = false
        textView.isScrollEnabled = false

        return textView
    }()
    func setupViews() {
        addSubview(headerLabel)
        addSubview(eventOverview)
        setupConstraints()
        backgroundColor = .white
    }
    private func setupConstraints(){
        headerLabel <- [
            Top(),
            Right(10),
            Left(10),
            Height(25)
        ]
        eventOverview <- [
            Top(8).to(headerLabel),
            Left(10),
            Right(10),
            Bottom(5),
            CenterX(0)
        ]
    }
}
