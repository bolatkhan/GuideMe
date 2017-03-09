//
//  DetailDatasource.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class DetailDatasource: Datasource {
    let section = ["AtrImage", "AtrOverview", "ToursAndActivities", "Reviews", "Location"]
    
//    override func footerClasses() -> [DatasourceCell.Type]? {
//        return [FooterCell.self]
//    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [AttractionImageCell.self, AttractionOverviewCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return section[indexPath.item]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    override func numberOfSections() -> Int {
        return 2
            //section.count
    }
    
    
}
