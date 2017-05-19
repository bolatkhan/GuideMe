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
class DetailAttrDatasourceController: DatasourceController {
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
        fetchTourFeed()
    }
    func loadData() {
        guard let attraction = attraction else { return }
        let detailDatasource = DetailDatasource()
        tour.forEach { (tour) in
            detailDatasource.tours += [Tour(id: tour.id, typeName: tour.typeName, typeIconUrl: tour.typeIconUrl, hostName: tour.hostName, hostLogoUrl: tour.hostLogoUrl, hostNumber: tour.hostNumber, hostDescription: tour.hostDescription, transportation: tour.transportation, tourImageUrlString: tour.tourImageUrlString, connectedPlaces: tour.connectedPlaces, name: tour.name, amountOfPeople: tour.amountOfPeople, duration: tour.duration, whatWeWillDo: tour.whatWeWillDo, generalInfo: tour.generalInfo, pricePerPerson: tour.pricePerPerson, departsAt: tour.departsAt, languages: tour.languages, whatToWear: tour.whatToWear, priceIncludes: tour.priceIncludes, priceExcludes: tour.priceExcludes)]
        }
        detailDatasource.attraction = [Attraction(id: "", name: attraction.name, shortDescription: attraction.shortDescription, attractionImageUrl: attraction.attractionImageUrl, fullDescription: attraction.fullDescription)]
        detailDatasource.overview = [Overview(tourDescription: attraction.fullDescription)]
        self.datasource = detailDatasource
    }
    let tron = TRON(baseURL: "http://karibay.pythonanywhere.com")
    class Tours: JSONDecodable{
        let tours: [Tour]
        required init(json: JSON) throws {
            var tours = [Tour]()
            let array = json[].array
            for tourJson in array! {
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
               
                
                let tour = Tour(id: id, typeName: typeName!, typeIconUrl: typeIconUrl!, hostName: hostName!, hostLogoUrl: hostLogoUrl!, hostNumber: hostNumber!, hostDescription: hostDescription!, transportation: transportation, tourImageUrlString: urlString, connectedPlaces: connectedPlaces, name: name, amountOfPeople: amountOfPeople, duration: duration, whatWeWillDo: whatWeWillDo, generalInfo: generalInfo, pricePerPerson: pricePerPerson, departsAt: departsAt, languages: languages, whatToWear: whatToWear, priceIncludes: priceIncludes, priceExcludes: priceExcludes)
                tours.append(tour)
            }
            self.tours = tours
        }
    }
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    fileprivate func fetchTourFeed(){
        let request:APIRequest<Tours,JSONError> = tron.request("/api/tours")
        request.parameters = ["place_id":(attraction!.id)]
        request.perform(withSuccess: {(tours) in
            self.tour = tours.tours
            self.loadData()
        
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
        if indexPath.section == 2 {
                let vc = TourViewController()
                let tour = self.tour[indexPath.row]
                vc.tour = tour
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
