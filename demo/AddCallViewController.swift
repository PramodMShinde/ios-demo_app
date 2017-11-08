//
//  AddCallViewController.swift
//  demo
//
//  Created by Websym Solutions on 10/30/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class AddCallViewController: UIViewController {

    enum TabIndex : Int {
        case selectCustomerTab = 0
        case selectContactTab = 1
        case callDetailsEntryTab = 2
    }
    @IBAction func ClearButtonClicked(_ sender: Any) {
    }
    
    @IBOutlet weak var AddCallSegmentedControl: UISegmentedControl!
    @IBOutlet weak var AddCallUIView: UIView!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var PreviousButton: UIButton!
    
    var currentViewController: UIViewController?
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectCustomerViewController")
        return firstChildTabVC
    }()
    
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectContactViewController")
        
        return secondChildTabVC
    }()
    
    lazy var thirdChildTabVC : UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "CallDetailEntryViewController")
        
        return thirdChildTabVC
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        PreviousButton.isHidden = true
        AddCallSegmentedControl.selectedSegmentIndex = TabIndex.selectCustomerTab.rawValue
        displayCurrentTab(TabIndex.selectCustomerTab.rawValue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    // MARK: - Switching Tabs Functions
    @IBAction func AddCallSegementIndexChanged(_ sender: UISegmentedControl) {
        
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            
            vc.view.frame = self.AddCallUIView.bounds
            self.AddCallUIView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.selectCustomerTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.selectContactTab.rawValue :
            vc = secondChildTabVC
        case TabIndex.callDetailsEntryTab.rawValue :
            vc = thirdChildTabVC
        default:
            return nil
        }
        
        return vc
    }

    @IBAction func SaveCallButtonClicked(_ sender: Any) {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.loggedIn = true
        delegate.setupRootViewController(animated: false)
    }
    
    @IBAction func PreviousButtonClicked(_ sender: Any) {
        
    }
    
    func hideShowButtons()
    {
        
    }
}
