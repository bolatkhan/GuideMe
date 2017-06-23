//
//  TourCollectionViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/11/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import LBTAComponents
import Device

class TourViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var containerView = UIView()
    var tour: Tour?
    lazy var mainDescriptionView: MainDescriptionView = {
        let view = MainDescriptionView()
        return view
    }()
    lazy var aboutHostView: AboutHostView = {
        let view = AboutHostView()
        return view
    }()
    lazy var whatWeWillDoView: WhatWeWillDoView = {
        let view = WhatWeWillDoView()
        return view
    }()
    lazy var detailsPriceView: DetailsPriceView = {
        let view = DetailsPriceView()
        return view
    }()
    lazy var detailsDepartView: DetailsDepartView = {
        let view = DetailsDepartView()
        return view
    }()
    lazy var detailLanguageView: DetailLanguageView = {
        let view = DetailLanguageView()
        return view
    }()
    lazy var detailTransportationView: DetailTransportationView = {
        let view = DetailTransportationView()
        return view
    }()
    lazy var priceIncludesView: PriceIncludesView = {
        let view = PriceIncludesView()
        return view
    }()
    lazy var priceExcludesView: PriceExcludesView = {
        let view = PriceExcludesView()
        return view
    }()
    lazy var bookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 241/255, green: 79/255, blue: 99/255, alpha: 1.0)
        button.setTitle("Book Now", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(presentBookViewController), for: .touchUpInside)
        return button
    }()
    func presentBookViewController() {
        let vc = BookNowViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func setupViews() {
        self.title = "Tour Overview"
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1355)
        scrollView.addSubview(mainDescriptionView)
        scrollView.addSubview(aboutHostView)
        scrollView.addSubview(whatWeWillDoView)
        scrollView.addSubview(detailsPriceView)
        scrollView.addSubview(detailsDepartView)
        scrollView.addSubview(detailLanguageView)
        scrollView.addSubview(detailTransportationView)
        scrollView.addSubview(priceIncludesView)
        scrollView.addSubview(priceExcludesView)
        scrollView.addSubview(bookButton)
        view.addSubview(scrollView)
        view.backgroundColor = UIColor(r: 232, g: 236, b: 241)
    }
    func setupConstraints() {
        mainDescriptionView <- [
            Height(350),
            Width().like(view),
            Top(0),
            CenterX(0)
        ]
        aboutHostView <- [
            Height(280),
            Width().like(view),
            Top(10).to(mainDescriptionView),
            CenterX(0)
        ]
        whatWeWillDoView <- [
            Height(300),
            Width().like(view),
            Top(10).to(aboutHostView),
            CenterX(0)
        ]
        detailsPriceView <- [
            Height(32),
            Width().like(view),
            Top(10).to(whatWeWillDoView),
            CenterX(0)
        ]
        detailsDepartView <- [
            Height(32),
            Width().like(view),
            Top(1).to(detailsPriceView),
            CenterX(0)
        ]
        detailLanguageView <- [
            Height(32),
            Width().like(view),
            Top(1).to(detailsDepartView),
            CenterX(0)
        ]
        detailTransportationView <- [
            Height(32),
            Width().like(view),
            Top(1).to(detailLanguageView),
            CenterX(0)
        ]
        priceIncludesView <- [
            Height(64),
            Width().like(view),
            Top(1).to(detailTransportationView),
            CenterX(0)
        ]
        priceExcludesView <- [
            Height(64),
            Width().like(view),
            Top(1).to(priceIncludesView),
            CenterX(0)
        ]
        bookButton <- [
            Height(44),
            Width().like(view),
            Top(1).to(priceExcludesView),
            CenterX(0)
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let staticURL = "http://108.61.179.192/"
        mainDescriptionView.nameLabel.text = tour?.name
        mainDescriptionView.tourImageView.loadImage(urlString: staticURL+(tour?.tourImageUrls?[0])!)
        if let temp = tour?.duration {
            mainDescriptionView.durationLabel.text=String(describing: temp) + " hours"
        }
        mainDescriptionView.peopleLabel.text = tour?.amountOfPeople
        aboutHostView.hostImage.loadImage(urlString: (tour?.hostLogoUrl)!)
        aboutHostView.hostName.text = tour?.hostName
        aboutHostView.hostOverview.text = tour?.hostDescription
        whatWeWillDoView.eventOverview.text = tour?.fullDescription
        detailsPriceView.priceView.text = tour?.price
        detailLanguageView.languageTextView.text = tour?.languages
        detailTransportationView.transportationTextView.text = tour?.transportation
        priceIncludesView.priceIncludesTextView.text = tour?.priceIncludes
        priceExcludesView.priceExcludesTextView.text = tour?.priceExcludes
        setupViews()
        setupConstraints()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
}
