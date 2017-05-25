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
    var staticURL = "http://karibay.pythonanywhere.com/"
    override var datasourceItem: Any?{
        didSet {
            guard let attraction = datasourceItem as? Attraction else { return }
            let imageCount = attraction.attractionImageUrls.count
            for i in 0..<imageCount {
                let pictureURL = URL(string: staticURL+(attraction.attractionImageUrls[i]))!
                // Creating a session object with the default configuration.
                // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
                let session = URLSession(configuration: .default)
                // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
                let downloadPicTask = session.dataTask(with: pictureURL) { (data, response, error) in
                    // The download has finished.
                    if let e = error {
                        print("Error downloading picture: \(e)")
                    } else {
                        // No errors found.
                        // It would be weird if we didn't have a response, so check for that too.
                        if (response as? HTTPURLResponse) != nil {
//                         print("Downloaded picture with response code \(res.statusCode)")
                            if let imageData = data {
                                // Finally convert that Data into an image and do what you wish with it.
                                let image = UIImage(data: imageData)
                                self.imageList[i] = image!
                                // Do something with your image.
                            } else {
                                print("Couldn't get image: Image is nil")
                            }
                        } else {
                            print("Couldn't get response code for some reason")
                        }
                    }
                }
                downloadPicTask.resume()
            }
        }
    }
    var imageList: [UIImage] = [
        UIImage(named: "placeholder")!,
        UIImage(named: "placeholder")!,
        UIImage(named: "placeholder")!,
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
