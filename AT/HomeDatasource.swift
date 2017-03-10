//
//  HomeDatasource.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    let words = ["Tour1", "Tour2", "Tour3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ToursCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
