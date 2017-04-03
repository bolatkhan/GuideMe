//
//  DetailDatasourceController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON



class DetailDatasourceController: DatasourceController {
    
    var tour = [Tour]()

    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later... "
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        return label
    }()
    
    var attraction: Attraction?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        self.title = "Details"
        guard let attraction = attraction else { return }
        
        
//        let detailDatasource = DetailDatasource()
//        detailDatasource.attraction = [Attraction(id: "", name: attraction.name, shortDescription: attraction.shortDescription, attractionImageUrl: attraction.attractionImageUrl, fullDescription: attraction.fullDescription)]
//        detailDatasource.overview = [Overview(tourDescription: attraction.fullDescription)]
//        
//        self.datasource = detailDatasource
        fetchTourFeed()
       
        
    }
    
    let tron = TRON(baseURL: "http://karibay.pythonanywhere.com")
    
    class Tour: JSONDecodable{
    
        required init(json: JSON) throws {
             print("Now ready to parse json: \n", json)
        }
    }
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    fileprivate func fetchTourFeed(){
        let request:APIRequest<Tour,JSONError> = tron.request("/api/tours")
        request.parameters = ["place_id":(attraction!.id)]
        request.perform(withSuccess: {(tours) in
            print("Successfully fetched our json object")
        }) { (err) in
            print("Failed to fetch json..",err)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize(width: view.frame.width, height: 0)
        }
        return CGSize(width: view.frame.width, height: 24)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0  {
            return CGSize(width: view.frame.width, height: 0)
        }
        return CGSize(width: view.frame.width, height: 14)
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (self.datasource?.item(indexPath) as? Tour) != nil {
            return CGSize(width: view.frame.width, height: 124)
        }
        if (self.datasource?.item(indexPath) as? Reviews) != nil {
            return CGSize(width: view.frame.width, height: 144)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let vc = OverviewViewController()
            vc.overviewText = attraction?.fullDescription ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
