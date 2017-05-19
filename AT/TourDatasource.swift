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
            let tourType = tourJson["type"].dictionary
            let typeName = tourType?["name"]?.stringValue
            let typeIconUrl = tourType?["icon"]?.stringValue
            
            let tourHost = tourJson["host"].dictionary
            let hostName = tourHost?["name"]?.stringValue
            let hostLogoUrl = tourHost?["logo"]?.stringValue
            let hostNumber = tourHost?["phone_number"]?.intValue
            let hostDescription = tourHost?["description"]?.stringValue
            
            let transportation = tourJson["transportation"].stringValue
            let tourImageUrl = tourJson["tour_images"].arrayValue
            let urlString = String(describing: tourImageUrl[0])
            let connectedPlaces = tourJson["places"].stringValue
            let name = tourJson["name"].stringValue
            let amountOfPeople = tourJson["amount_of_people"].stringValue
            let duration = tourJson["duration"].stringValue
            let whatWeWillDo = tourJson["what_will_do"].stringValue
            let generalInfo = tourJson["general_info"].stringValue
            
            let pricePerPerson = tourJson["price_per_person"].stringValue
            let departsAt = tourJson["price_per_person"].stringValue
            let languages = tourJson["languages"].stringValue
            let whatToWear = tourJson["what_to_wear"].stringValue
            let priceIncludes = tourJson["price_includes"].stringValue
            let priceExcludes = tourJson["price_excludes"].stringValue
            
            
            let tour = Tour(id: id, typeName: typeName!, typeIconUrl:typeIconUrl!, hostName: hostName, hostLogoUrl: hostLogoUrl, hostNumber: hostNumber, hostDescription: hostDescription, transportation: transportation, tourImageUrlString: urlString, connectedPlaces: connectedPlaces, name: name, amountOfPeople: amountOfPeople, duration: duration, whatWeWillDo: whatWeWillDo, generalInfo: generalInfo, pricePerPerson: pricePerPerson, departsAt: departsAt, languages: languages, whatToWear: whatToWear, priceIncludes: priceIncludes, priceExcludes: priceExcludes)
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
