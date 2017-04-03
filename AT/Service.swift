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

struct Service {
    
    let tron = TRON(baseURL: "http://karibay.pythonanywhere.com")


    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error? ) -> ()) {
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("api/places")
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource, nil)
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
