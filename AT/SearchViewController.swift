//
//  SearchViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 1/25/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy


class SearchViewController: UIViewController {
    
    let text = "Coming soon.."
    
    let labelView: UILabel = {
        var labelView = UILabel()
        return labelView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Controller"
        view.addSubview(labelView)
        labelView.text = text
        view.backgroundColor = .white
        labelView <- [
            Center()
        ]
        
    }
    
  
}
