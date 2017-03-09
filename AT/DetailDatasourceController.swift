//
//  DetailDatasourceController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class DetailDatasourceController: DatasourceController {
    
    var words = [String: AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .gray
        self.title = "Details"
        let detailDatasource = DetailDatasource()
        self.datasource = detailDatasource
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 50)
//    }
    
       override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
        
    }

}
