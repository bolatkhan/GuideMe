//
//  DetailViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 1/23/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import DeviceKit


class DetailViewController: UIViewController, UITableViewDelegate{
    
    var attraction = [String: AnyObject]()
    var tours = [[String: AnyObject]]()
    var reviews = [[String: AnyObject]]()
    var tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    private func setupViews(){
        self.title = "Destinations"
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
//        tableView.register(OverviewTableViewCell.self, forCellReuseIdentifier: OverviewTableViewCell.identifier)
        tableView.backgroundColor = .gray
        view.addSubview(tableView)
    }
    private func setupConstraints(){
        tableView <- [
            Edges(0)
        ]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        } else if section == 1{
//            return tours.count
//        } else if section == 2{
//            return reviews.count
//        } else if section == 3{
//            return 1
//        }
        return 1
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//                        let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.identifier, for: indexPath) as! OverviewTableViewCell
//                cell.tourFullDescription.text = attraction["full_description"] as? String ?? ""
//                return cell
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailTour = OverviewViewController()
        detailTour.overview.text = attraction["full_description"] as? String ?? ""
        self.navigationController?.pushViewController(detailTour, animated: true)

    }
}
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    
//    }
//
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        return view
//    }
