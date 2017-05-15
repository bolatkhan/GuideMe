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

class AttractionImageCell: DatasourceCell  {
    
//    class CollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//        private let cellId = "cellId"
//        
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            collectionView?.backgroundColor = UIColor.white
//            
//        }
//        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImagesCell
//            return cell
//        }
//        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return 3
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: view.frame.width, height: 5)
//        }
//    }
//    class ImagesCell: UICollectionViewCell {
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            setupViews()
//        }
//        
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//        func setupViews(){
//            backgroundColor = UIColor.red
//        }
//    }
    
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
        addSubview(cellBackgroundImageView)
        cellBackgroundImageView.addSubview(imgOverlay)
        cellBackgroundImageView.addSubview(tourName)
        cellBackgroundImageView.addSubview(tourShortDescription)
        cellBackgroundImageView <- [
            Edges(0)
        ]
        imgOverlay <- [
            Edges(0)
        ]
        tourName <- [
            Center(),
            Left(12),
            Right(12)
        ]
        tourShortDescription <- [
            Bottom(5).to(tourName),
            CenterX()
        ]
    }
}
