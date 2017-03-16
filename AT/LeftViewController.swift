//
//  LeftViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 1/25/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    
    init(){
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView: UITableView = UITableView.init(frame: CGRect( x: 0, y: (self.view.frame.size.height - 54 * 5) / 2.0, width: self.view.frame.size.width, height: 54 * 5), style: UITableViewStyle.plain)
        tableView.autoresizingMask = [UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin, UIViewAutoresizing.flexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.bounces = false
        
        self.tableView = tableView
        self.view.addSubview(self.tableView!)
    }
  
    // MARK: - <UITableViewDelegate>
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.sideMenuViewController!.setContentViewController(UINavigationController.init(rootViewController: HomeDatasourceController.init()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
        case 1:
            self.sideMenuViewController!.setContentViewController(UINavigationController.init(rootViewController: SecondViewController.init()), animated: true)
            self.sideMenuViewController!.hideMenuViewController()
        default:
            break
        }
    }
    // MARK: - <UITableViewDataSource>
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "Cell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellIdentifier)
            cell!.backgroundColor = UIColor.clear
            cell!.textLabel?.font = UIFont.init(name: "HelveticaNeue", size: 21)
            cell!.textLabel?.textColor = UIColor.white
            cell!.textLabel?.highlightedTextColor = UIColor.lightGray
            cell!.selectedBackgroundView = UIView.init()
        }
        
        var titles: [String] = ["Home", "Proile", "Favorites", "Settings", "Log Out"]
        var images: [String] = ["", "", "", "", ""]
        cell!.textLabel?.text = titles[(indexPath as NSIndexPath).row]
        cell!.imageView?.image = UIImage.init(named: images[(indexPath as NSIndexPath).row])
        
        return cell!
    }
}
