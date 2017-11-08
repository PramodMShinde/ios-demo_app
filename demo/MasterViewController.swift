//
//  MasterViewController.swift
//  demo
//
//  Created by Websym Solutions on 10/25/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var isLoadingTable = true
    var loggedIn = false
    
    override func viewWillAppear(_ animated: Bool) {
        //self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //select first row by default (doesn't work if launched in portrait)
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isLoadingTable && tableView.indexPathsForVisibleRows?.last?.row == indexPath.row {
            isLoadingTable = false
            tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(indexPath.row)
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "ShowHome", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "ShowAccounts", sender: nil)
       // case 2 :
            //self.performSegue(withIdentifier: "ShowContacts", sender: nil)
        case 3 :
            self.performSegue(withIdentifier: "ShowCalls", sender: nil)
        default:
            break
            
        }
    }
    
}

