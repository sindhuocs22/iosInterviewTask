//
//  AppDelegate.swift
//  ios Task
//
//  Created by INFOSYS on 18/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.setupInitialViewController()
    return true
  }
  // MARK: - initial ViewController
  func setupInitialViewController() {

    //Initial view controller with navigation controller
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    let navigationController = UINavigationController(rootViewController: CountryList())
    navigationController.navigationBar.barTintColor = UIColor.white
    window?.rootViewController = navigationController
  }
}
