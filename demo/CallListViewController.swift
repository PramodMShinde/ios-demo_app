//
//  CallListViewController.swift
//  demo
//
//  Created by Websym Solutions on 10/26/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class CallListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var CallListTableView: UITableView!
    @IBOutlet weak var AddCallBtn: UIButton!
    
    var ContactPerson: [String] = ["Nilesh Jadhav", "Vijay Kamble", "Reena Shah", "Chandan Shukla", "Ajay Pawar"]
    var CallReason: [String] = ["Normal Discussion ..", "Change request of ..", "Mantainance setup ..", "Order related ..", "Purchase order issue .."]
    var CallTiming: [String] = ["12/09/2017 12:00:00", "15/09/2017 14:10:00", "21/09/2017 17:30:00", "28/09/2017 10:15:00", "03/10/2017 13:30:00"]
    
    override func viewDidLoad() {

        super.viewDidLoad()

        CallListTableView.delegate = self
        CallListTableView.dataSource = self
        self.CallListTableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
        //draw the menu button in portrait mode
        if let splitView = self.navigationController?.splitViewController, !splitView.isCollapsed {
            self.navigationItem.leftBarButtonItem = splitView.displayModeButtonItem
        }
        print("Call list page loaded")
    }
    
    @IBAction func AddCallButtonClicked(_ sender: Any) {
        
        let addCallController = self.storyboard?.instantiateViewController(withIdentifier: "AddCallViewController") as! AddCallViewController
        present(addCallController, animated: false, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CallDetail", for: indexPath) as! CallListTableViewCustomCellTableViewCell
        
        cell.column1.text = self.ContactPerson[indexPath.row]
        cell.column2.text = self.CallReason[indexPath.row]
        cell.column3.text = self.CallTiming[indexPath.row]
        return cell
    }
    
    
}

