//
//  OverviewViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 2/24/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {

    let overview: UILabel  = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(overview)
        view.backgroundColor = .white
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
