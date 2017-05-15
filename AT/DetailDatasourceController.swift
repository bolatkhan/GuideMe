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
        fetchTourFeed()
    }
    func loadData() {
        guard let attraction = attraction else { return }
        let detailDatasource = DetailDatasource()
        tour.forEach { (tour) in
            detailDatasource.tours += [Tour(id: tour.id, tourImageUrl: tour.tourImageUrl, name: tour.name, type: tour.type, rating: tour.rating, distance: tour.distance, durationType: tour.durationType, duration: tour.duration, cost: tour.cost, placeId: tour.placeId, numberOfPeople: tour.numberOfPeople, description: tour.description)]
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
                let name = tourJson["name"].stringValue
                let price = tourJson["price"].intValue
                let imageUrl = tourJson["tour_images"].arrayValue
                let urlString = String(describing: imageUrl[0])
                let placeId = tourJson["place"].intValue
                let id = tourJson["id"].intValue
                let durationType = tourJson["duration_type"].stringValue
                let duration = tourJson["duration"].stringValue
                let numberOfPeople = tourJson["amount_of_people"].stringValue
                let description = tourJson["description"].stringValue
                let tourType = tourJson["type"].object
                let tourHost = tourJson["host"].dictionary
                let hostName = tourHost?["name"]?.stringValue
               
                
                let tour = Tour(id: id, tourImageUrl: urlString, name: name, type: "Nature Landmarks", rating: "*****", distance: "12km", durationType: durationType, duration: duration , cost: price, placeId: placeId, numberOfPeople: numberOfPeople, description: description)
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
