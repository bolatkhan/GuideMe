//
//  HomeDatasourceController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 3/9/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
    
    var attractions = [[String: AnyObject]]()
    var stringURL = "http://karibay.pythonanywhere.com/api/places?format=json"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Destinations"
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
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
       //             self.tableView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailTour = DetailDatasourceController()
//       let tour = words[indexPath]
//        detailTour.words = tour
        self.navigationController?.pushViewController(detailTour, animated: true)

    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)

    }
    
}
