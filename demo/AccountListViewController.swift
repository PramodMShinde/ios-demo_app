//
//  AccountListViewController.swift
//  demo
//
//  Created by Websym Solutions on 10/26/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class AccountListViewController: UIViewController {

    @IBOutlet weak var segueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //draw the menu button in portrait mode
        if let splitView = self.navigationController?.splitViewController, !splitView.isCollapsed {
            self.navigationItem.leftBarButtonItem = splitView.displayModeButtonItem
        }
        print("Account list page loaded")
    }

}
