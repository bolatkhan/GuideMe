//
//  TourDatasource.swift
//  AT
//
//  Created by Askhat Bolatkhan on 5/18/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class TourDatasource: Datasource, JSONDecodable {
    let tours: [Tour]
    required init(json: JSON) throws {
        var tours = [Tour]()
        let tourArrayJson = json[].array
        for tourJson in (tourArrayJson)! {
            let id = tourJson["id"].intValue
            
            let tourHost = tourJson["host"].dictionary
            let hostName = tourHost?["name"]?.stringValue
            let hostLogoUrl = tourHost?["logo"]?.stringValue
            let hostDescription = tourHost?["info"]?.stringValue
            
            let transportation = tourJson["transportation"].stringValue
            let tourImageUrls = tourJson["images"].arrayObject as? [String]
            let connectedPlaces = tourJson["places"].stringValue
            let name = tourJson["name"].stringValue
            let amountOfPeople = tourJson["guests"].stringValue
            let durationType = tourJson["duration_step"].stringValue
            let duration = tourJson["duration"].intValue
            let pricePerPerson = tourJson["price"].stringValue
            let fullDescription = tourJson["full_description"].stringValue
            let languages = tourJson["langs"].stringValue
            let priceIncludes = tourJson["price_includes"].stringValue
            let priceExcludes = tourJson["price_excludes"].stringValue
            
            let tour = Tour(id: id, transportation: transportation, tourImageUrls: tourImageUrls!, connectedPlaces: connectedPlaces, durationType: durationType, duration: duration, amountOfPeople: amountOfPeople, name: name, price: pricePerPerson, fullDescription: fullDescription, languages: languages, priceIncludes: priceIncludes, priceExcludes: priceExcludes, hostName: hostName, hostLogoUrl: hostLogoUrl, hostDescription: hostDescription)
            tours.append(tour)
        }
        self.tours = tours
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ToursCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return tours[indexPath.item]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return tours.count
    }
}
