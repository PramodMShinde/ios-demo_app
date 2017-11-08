//
//  LoginViewController.swift
//  demo
//
//  Created by Websym Solutions on 10/27/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginBtnClicked(_ sender: Any) {
        
        if usernameTxt.text == "admin" && passwordTxt.text == "admin" {
            //dismiss(animated: true, completion: nil)
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.loggedIn = true
           delegate.setupRootViewController(animated: false)
        }
        else{
            let alertController = UIAlertController(title: "Login failed", message: "Incorrect Username or Password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }

}
