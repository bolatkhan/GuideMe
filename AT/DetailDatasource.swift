//
//  DetailDatasource.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class DetailDatasource: Datasource {
    var attraction: [Attraction] = {
        let attraction = Attraction(id:"",name: "", shortDescription: "",attractionImageUrls: [], fullDescription: "")
        return [attraction]
    }()
    var overview: [Overview] = {
        let overview = Overview(tourDescription: "This is Big Almaty Lake, coolest place near to Almaty. Beauty of Almaty, must have place to visit")
        return [overview]
    }()
    var tours: [Tour] = {
        let firstTour = Tour(id: 0, transportation: "", tourImageUrls: [""], connectedPlaces: "", durationType: "", duration: 0, amountOfPeople: "", name: "", price: "", fullDescription: "", languages: "", priceIncludes: "", priceExcludes: "", hostName: "", hostLogoUrl: "", hostDescription: "")
        return []
    }()
    let reviews: [Reviews] = {
         let firstReview = Reviews(profileImageView: #imageLiteral(resourceName: "userpic"), nameLabel: "Askhat Bolatkhan", rating: "*****", date: "March 2017", review: "Good place to visit!!!")
        let secReview = Reviews(profileImageView: #imageLiteral(resourceName: "baha"), nameLabel: "Bakhtiyar Sadabaev", rating: "*****", date: "April 2017", review: "Awesome view!")
        return [firstReview, secReview]
    }()
    
    let titles: [Titles] = {
        let firstTitle = Titles(titleName: "Overview")
        let secondTitle = Titles(titleName: "Tours&Activities")
        let thirdTitle = Titles(titleName: "Reviews")

        return [firstTitle,secondTitle,thirdTitle ]
    }()
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    override func headerClasses() -> [DatasourceCell.Type]? {
        return[HeaderCell.self]
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [AttractionImageCell.self, AttractionOverviewCell.self, ToursAndActivities.self]
//        ReviewCell.self
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 0 {
            return attraction[indexPath.item]
        }
        if indexPath.section == 1 {
            return overview[indexPath.item]
        }
        if indexPath.section == 2 {
            return tours[indexPath.item]
        }
        if indexPath.section == 3 {
            return reviews[indexPath.item]
        }
//        return tours[indexPath.item]
        return 0
    }
    override func numberOfItems(_ section: Int) -> Int {
        if section == 2 {
            return tours.count
        }
        if section == 3 {
            return reviews.count
        }
        return 1
    }
    override func numberOfSections() -> Int {
        return 3
    }
    override func headerItem(_ section: Int) -> Any? {
        if section == 1 {
            return titles[0]
        }
        if section == 2 {
            return titles[1]
        }
        if section == 3 {
            return titles[2]
        }
        return titles
    }
}
