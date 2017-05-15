//
//  SecondViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 1/30/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tours"
        self.view.backgroundColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.presentLeftMenuViewController(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "search"), style: .plain, target: self, action: nil)
//         #selector(presentSearchViewController)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
//        let button: UIButton = UIButton.init(type: UIButtonType.roundedRect)
//        button.frame = CGRect(x: 0, y: 84, width: self.view.frame.size.width, height: 44)
//        button.autoresizingMask = UIViewAutoresizing.flexibleWidth
//        button.setTitle("Push View Controller", for: UIControlState())
//        button.addTarget(self, action: #selector(SecondViewController.pushViewController(_:)), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(button)
    }
//    func pushViewController(_ sender: AnyObject) {
//        let viewController = UIViewController.init()
//        viewController.title = "Pushed Controller"
//        viewController.view.backgroundColor = UIColor.white
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
//    func presentSearchViewController() {
//        let vc = SearchViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        //self.present(vc, animated: true, completion: nil)
//    }
    
//    open override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        NSLog("SecondViewController will appear")
//    }
//    open override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
////        NSLog("SecondViewController will disappear")
//    }
    
}
