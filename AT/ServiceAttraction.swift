//
//  Service.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/17/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct ServiceAttraction {
    
    let tron = TRON(baseURL: "http://108.61.179.192/")
    static let sharedInstance = ServiceAttraction()
    func fetchAttrFeed(completion: @escaping (AttractionDatasource?, Error? ) -> ()) {
        let request: APIRequest<AttractionDatasource, JSONError> = tron.request("api/places")
        request.perform(withSuccess: { (attractionDatasource) in
            completion(attractionDatasource, nil)
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
