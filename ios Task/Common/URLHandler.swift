//
//  URLHandler.swift
//  ios Task
//
//  Created by INFOSYS on 19/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

//Class used to Handle API Calls get,post and Image upload

class URLHandler: NSObject {

  static let sharedInstance = URLHandler()

  func sendRequestToGetAPICall(parentController: UIViewController, _ completion: @escaping (_ data: Data?) -> Void) {

    //Below line checks whether Network is available or not

    if Reachability.isConnectedToNetwork() {

      //Loader
      Themes.sharedInstance.showProgresss()

      //Below line used to get common url from constant file
      //guard function is used to unwrapping the nil values

      guard let url = URL(string: Constants.Baseurl) else { return }

      URLSession.shared.dataTask(with: url) { (data, _, _) in

        // Functions gives binary data from json url using urlSession

        Themes.sharedInstance.dismissProgress()

        if let datas = data {

          if let value = String(data: datas, encoding: String.Encoding.ascii) {

            if let jsonData = value.data(using: String.Encoding.utf8) {

              completion(jsonData)
            }
          }

        } else {

          DispatchQueue.main.async {
            //shows error alert when response is error
            Themes.sharedInstance.showResponseErrorAlert(controller: parentController)
          }
        }
        }.resume()
    } else {

      //Shows error alert if no network availble
      Themes.sharedInstance.showNetworkErrorAlert(controller: parentController)

    }

  }
}
