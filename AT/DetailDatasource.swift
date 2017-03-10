//
//  DetailDatasource.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class DetailDatasource: Datasource {
   //    override func footerClasses() -> [DatasourceCell.Type]? {
//        return [FooterCell.self]
//    }
    
    let tours: [Tour] = {
        let firstTour = Tour(tourImage: #imageLiteral(resourceName: "bao"), name: "Big Almaty Lake", type: "Nature beauty", rating: "*****" , distance: "12km", time: "3 hours", cost: "$20")
         let secondTour = Tour(tourImage: #imageLiteral(resourceName: "bao"), name: "Big Almaty Lake1", type: "Nature beauty", rating: "*****" , distance: "12km", time: "3 hours", cost: "$20")
        
        return [firstTour,secondTour]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [AttractionImageCell.self, AttractionOverviewCell.self, ToursAndActivities.self, ReviewCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return tours[indexPath.item]
    }
    override func numberOfItems(_ section: Int) -> Int {
        if section == 2 {
            return tours.count
        }
        return 1
    }
    override func numberOfSections() -> Int {
        return 4
    }

    
    
}
