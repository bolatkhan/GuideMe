//
//  HomeDatasourceController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON
import UIKit

class HomeDatasourceController: DatasourceController {
    var attractions = [Attraction]()
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later... "
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        self.title = "Destinations"
        Service.sharedInstance.fetchHomeFeed{(homeDatasource,err) in
            if let _ = err {
                self.errorMessageLabel.isHidden = false
                return
            }
            self.datasource = homeDatasource
            self.attractions = (homeDatasource?.attractions)!
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image:#imageLiteral(resourceName: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.presentLeftMenuViewController(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "search"), style: .plain, target: self, action: nil )
//        #selector(presentSearchViewController)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
//    func presentSearchViewController() {
//        let vc = SearchViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailTour = DetailDatasourceController()
        let attraction =  attractions[indexPath.row]
        detailTour.attraction = attraction
        self.navigationController?.pushViewController(detailTour, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
