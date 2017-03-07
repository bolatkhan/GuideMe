//
//  ViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 1/17/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import DeviceKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    let device = Device()
    var tableView: UITableView = UITableView()
    var attractions = [[String: AnyObject]]()
    var stringURL = "http://karibay.pythonanywhere.com/api/places?format=json"
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadTours()
        self.title = "Destinations"
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image:#imageLiteral(resourceName: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.presentLeftMenuViewController(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(presentSearchViewController))
    }
    // MARK: - Networking
    func downloadTours() {
        guard let url = URL(string: stringURL) else {
            print("url problem")
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let jsonData = data else {
                print("no data has been downloaded")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                    as? [[String: AnyObject]] else { return }
                    //, let places = json["places"] as? [[String: AnyObject]] else { return }
                self.attractions = json
               // print(json)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            } catch {
                print("error with JSON: ")
            }
        })
        task.resume()
    }
    func presentSearchViewController() {
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
        let identifier = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCell
        if (cell == nil) {
            cell = CustomTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        let tour = attractions[indexPath.row]
        cell?.tourName.text = tour["name"] as? String ?? ""
        cell?.tourShortDescription.text = tour["short_description"] as? String ?? ""
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailTour = DetailViewController()
        let tour = attractions[indexPath.row]
        detailTour.attraction = tour
        self.navigationController?.pushViewController(detailTour, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if device.isPod {
            return 176;
        } else if device.isPhone {
            return 176;
        } else if device.isPad {
            return 528;
        }
        return 176;
    }
}


