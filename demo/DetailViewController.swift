//
//  DetailViewController.swift
//  demo
//
//  Created by Websym Solutions on 10/25/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var selectedMenuLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //draw the menu button in portrait mode
        if let splitView = self.navigationController?.splitViewController, !splitView.isCollapsed {
            self.navigationItem.leftBarButtonItem = splitView.displayModeButtonItem
        }
        print("Home page loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

