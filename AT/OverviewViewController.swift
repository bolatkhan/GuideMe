//
//  OverviewViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 2/24/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//
import LBTAComponents
import EasyPeasy
import UIKit


class OverviewViewController: UIViewController {

    var overviewText = ""
    var detailDatasource = DetailDatasource()
    
    var overview: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.avenirMedium(fontSize: 14)
        textView.textColor = .black
        textView.text = "Sorry, some error"
        textView.backgroundColor = .clear
        textView.isEditable = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Overview"
        view.addSubview(overview)
        view.backgroundColor = .white
        overview.text = overviewText
        overview <- [
            Edges(5)
        ]
    }
   }
