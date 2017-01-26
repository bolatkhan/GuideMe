//
//  DetailViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 1/23/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{

    var tourImage: UIImageView = UIImageView()
    var tourName: UILabel = UILabel()
    var tourDescription: UILabel = UILabel()
    var tourSeason: UILabel = UILabel()
    var tourRoute: UILabel = UILabel()
    var foodPlaces: UILabel = UILabel()
    var accomodation: UILabel = UILabel()
    var price: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}
