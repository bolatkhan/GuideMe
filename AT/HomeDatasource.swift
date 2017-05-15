//
//  HomeDatasource.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    let attractions: [Attraction]
    required init(json: JSON) throws {
        var attractions = [Attraction]()
        let attrArrayJson = json[].array
        for attrJson in attrArrayJson! {
            let id = attrJson["id"].stringValue
            let name = attrJson["name"].stringValue
            let shortDescription = attrJson["short_description"].stringValue
            let fullDescription = attrJson["full_description"].stringValue
            let attractionImageUrls = attrJson["images"].arrayObject as? [String]
            let attraction = Attraction(id: id,name: name, shortDescription: shortDescription,attractionImageUrl: attractionImageUrls?[0] , fullDescription: fullDescription)
                attractions.append(attraction)

           
        }
         self.attractions = attractions
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ToursCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return attractions[indexPath.item]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return attractions.count
    }
}
