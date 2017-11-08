//
//  SelectContactViewController.swift
//  demo
//
//  Created by Websym Solutions on 10/30/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class SelectContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    
    @IBOutlet weak var contactSearchBar: UISearchBar!
    @IBOutlet weak var contactSearchSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ContactSearchResult: UITableView!
    
    var searchActive : Bool = false
    var contactData = ["HDFC Reality Pvt. Ltd.", "Websym Solutions", "Vijay Enterprises Ltd.", "Axis Finance Pvt. Ltd.", "DhanLaxmi Finanace Ltd.", "Amit Enterpries Ltd.", "Canara Fin Pvt Ltd."]
    var filtered:[String] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        contactSearchBar.delegate = self
        ContactSearchResult.dataSource = self
        ContactSearchResult.delegate = self
        ContactSearchResult.isHidden = true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return contactData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell")! as UITableViewCell;
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = contactData[indexPath.row];
        }
        
        return cell;
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //if (searchText.characters.count) > 2 {
        filtered = contactData.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            //ContactSearchResult.isHidden = false
            searchActive = false;
        } else {
            //ContactSearchResult.isHidden = false
            searchActive = true;
        }
        self.ContactSearchResult.reloadData()
        // }
    }
}
