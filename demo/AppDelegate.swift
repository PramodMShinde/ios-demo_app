//
//  AppDelegate.swift
//  demo
//
//  Created by Websym Solutions on 10/25/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    var loggedIn = false;

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        splitViewController.delegate = self
        setupRootViewController(animated: false)
        return true
    }

    // MARK: - Split view

    func setupRootViewController(animated: Bool) {
        if let window = self.window {
            var newRootViewController: UIViewController? = nil
            var transition: UIViewAnimationOptions
            
            // create and setup appropriate rootViewController
            if !loggedIn {
                let loginViewController = window.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                newRootViewController = loginViewController
                transition = .transitionFlipFromLeft
                
            } else {
                let splitViewController = window.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "LandingSplitViewController") as! UISplitViewController
                let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
                navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
                splitViewController.delegate = self
                
                let masterNavigationController = splitViewController.viewControllers[0] as! UINavigationController
                _ = masterNavigationController.topViewController as! MasterViewController
                //let splitViewController = self.window!.rootViewController as! UISplitViewController
                //splitViewController.delegate = self
                newRootViewController = splitViewController
                transition = .transitionFlipFromRight
            }
            
            // update app's rootViewController
            if let rootVC = newRootViewController {
                if animated {
                    UIView.transition(with: window, duration: 0.5, options: transition, animations: { () -> Void in
                        window.rootViewController = rootVC
                    }, completion: nil)
                } else {
                    window.rootViewController = rootVC
                }
            }
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        return true
    }

}

