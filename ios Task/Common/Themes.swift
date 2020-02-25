//
//  Themes.swift
//  ios Task
//
//  Created by INFOSYS on 19/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import Foundation
import SVProgressHUD
import Toast_Swift

class Themes: NSObject {

  static let sharedInstance = Themes()

  func showNetworkErrorAlert(controller: UIViewController) {

    //If network is not connected
    controller.view.makeToast(NSLocalizedString("no_network", comment: ""))
  }
  func showResponseErrorAlert(controller: UIViewController) {

    //connected by internet but error in Response
    controller.view.makeToast(NSLocalizedString("response_error", comment: ""))

  }
  func showProgresss() {

    SVProgressHUD .show()
  }
  func dismissProgress() {

    SVProgressHUD.dismiss()
  }
}
