//
//  DetailView.swift
//  AT
//
//  Created by Askhat Bolatkhan on 2/21/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy

class DetailView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var tourName: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Kayindi Lakes"
        return label
    }()
    
    lazy var tourShortDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Type of meeting"
        return label
    }()
    lazy var tourFullDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Tour info"
        label.contentMode = .scaleAspectFill
        label.clipsToBounds = true
        return label
    }()
    lazy var imgOverlay: UIView = {
        let overlay =  UIView()
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        return overlay
    }()
    lazy var tourImages: UIImageView = {
        let tourImages = UIImageView()
        tourImages.image = UIImage(named: "bao.jpg")
        tourImages.contentMode = .scaleAspectFill
        tourImages.clipsToBounds = true
        return tourImages
    }()
    
   
      private func setupViews(){

        [imgOverlay, tourName, tourShortDescription].forEach{
            tourImages.addSubview($0)
        }
        
        [tourImages].forEach{
            scrollView.addSubview($0)
        }
        
        [tourFullDescription].forEach{
            scrollView.addSubview($0)
        }
        setupConstraints()
    }
    
    private func setupConstraints(){
        tourImages <- [
            CenterX(0),
            CenterY(-10),
            Width(100),
            Height(100)
        ]
        imgOverlay <- [
            Edges(0)
        ]
        tourName <- [
            CenterX(0),
            CenterY(-10),
            Width(100),
            Height(100)
        ]
        tourShortDescription <- [
            Top(5).to(tourName),
            CenterX(0),
            Left(40),
            Right(40)
        ]
        tourFullDescription <- [
            Top(5).to(tourImages),
            CenterX(0),
            Left(5),
            Right(5)
        ]
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height + 20)

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
}
