//
//  ServiceTour.swift
//  AT
//
//  Created by Askhat Bolatkhan on 5/18/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct ServiceTours {
    
    let tron = TRON(baseURL: "http://karibay.pythonanywhere.com")
    static let sharedInstance = ServiceTours()
    func fetchToursFeed(completion: @escaping (TourDatasource?, Error? ) -> ()) {
        let request: APIRequest<TourDatasource, JSONError> = tron.request("api/tours")
        request.perform(withSuccess: { (tourDatasource) in
            completion(tourDatasource, nil)
        }) { (err) in
            completion(nil, err)
        }
    }
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
