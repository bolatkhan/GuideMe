//
//  BookNowViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/21/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy

class BookNowViewController: UIViewController {
//    let text = "Coming soon.."
//    
//    let labelView: UILabel = {
//        var labelView = UILabel()
//        return labelView
//    }()
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cloudColor
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1 / UIScreen.main.scale
        view.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        return view
    }()
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.cloudColor
        let attr = [NSForegroundColorAttributeName : UIColor(white: 0.8, alpha: 1.0),
                    NSFontAttributeName: UIFont.avenirUltraLight(fontSize: 12)]
        textField.attributedPlaceholder = NSAttributedString(string: "Login", attributes: attr)
        textField.font = UIFont.avenirMedium(fontSize: 14)
        textField.textColor = UIColor.lightGray
//        textField.delegate = self
        return textField
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book now"
        view.addSubview(loginTextField)
//        labelView.text = text
        view.backgroundColor = .white
        loginTextField <- [
            Height(49),
            Width(200),
            Top(12),
            Left(10),
            Right(10)
        ]
    }
}
