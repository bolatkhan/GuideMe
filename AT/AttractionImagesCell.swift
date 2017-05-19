//
//  AttractionImagesCell.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import EasyPeasy
import Reusable
import UIKit

class AttractionImageCell: DatasourceCell  {
    var imageList: [UIImage] = [
        UIImage(named: "me")!,
        UIImage(named: "main")!,
        UIImage(named: "bao")!
    ]
    
    private lazy var layout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(cellType: ImageCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        return collectionView
    }()
    
    fileprivate lazy var pageControl = UIPageControl()
    
    var staticURL = "http://karibay.pythonanywhere.com/"
    override var datasourceItem: Any?{
        didSet {
            guard let attraction = datasourceItem as? Attraction else { return }
            tourName.text = attraction.name
            tourShortDescription.text = attraction.shortDescription
            cellBackgroundImageView.loadImage(urlString: staticURL+attraction.attractionImageUrl!)
        }
    }    
    lazy var imgOverlay: UIView = {
        let overlay =  UIView()
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        return overlay
    }()
    
   
    lazy var cellBackgroundImageView: CachedImageView = {
        let backgroundImageView = CachedImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        return backgroundImageView
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
        label.text = "Type of attraction"
        return label
    }()
    
  
    override func setupViews() {
        super.setupViews()
        backgroundColor = .black
//        addSubview(cellBackgroundImageView)
//        cellBackgroundImageView.addSubview(imgOverlay)
//        cellBackgroundImageView.addSubview(tourName)
//        cellBackgroundImageView.addSubview(tourShortDescription)
//        cellBackgroundImageView <- [
//            Edges(0)
//        ]
//        imgOverlay <- [
//            Edges(0)
//        ]
//        tourName <- [
//            Center(),
//            Left(12),
//            Right(12)
//        ]
//        tourShortDescription <- [
//            Bottom(5).to(tourName),
//            CenterX()
//        ]
        self.contentView.addSubview(collectionView)
        self.contentView.addSubview(pageControl)
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .blue
        pageControl <- [
            CenterX(0),
            Bottom(5),
            Width(100),
            Height(20)
        ]
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
        self.collectionView.frame = frame
        self.layout.itemSize = frame.size
        
    }
}

extension AttractionImageCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = imageList.count
        return imageList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as ImageCollectionViewCell
        cell.imageView.image = imageList[indexPath.row]
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / self.contentView.frame.width)
    }
}
