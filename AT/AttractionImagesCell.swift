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
import Kingfisher
class AttractionImageCell: DatasourceCell  {
    var staticURL = "http://108.61.179.192/"
    var imgUrls: [String] = []
    override var datasourceItem: Any?{
        didSet {
            guard let attraction = datasourceItem as? Attraction else { return }
            let imageCount = attraction.attractionImageUrls?.count
            for i in 0..<imageCount! {
                self.imgUrls.append(staticURL+(attraction.attractionImageUrls?[i])!)
            }
        }
    }
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
    override func setupViews() {
        super.setupViews()
        backgroundColor = .black
        self.contentView.addSubview(collectionView)
        self.contentView.addSubview(pageControl)
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .black
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
        self.pageControl.numberOfPages = imgUrls.count
        return imgUrls.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(for: indexPath) as ImageCollectionViewCell
            let image = UIImage(named: "placeholder")
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: URL(string: imgUrls[indexPath.row])!, placeholder: image)
            return cell
        }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            self.pageControl.currentPage = Int(scrollView.contentOffset.x / self.contentView.frame.width)
        }
}


