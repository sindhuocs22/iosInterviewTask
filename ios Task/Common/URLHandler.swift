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

  func sendRequestToGetAPICall(_ completion: @escaping (_ data: Data?,_ error : Error?) -> Void) {

    //Below line checks whether Network is available or not

      //Loader
      Themes.sharedInstance.showProgresss()

      //Below line used to get common url from constant file
      //guard function is used to unwrapping the nil values

      guard let url = URL(string: Constants.Baseurl) else { return }

      URLSession.shared.dataTask(with: url) { (data, _, error) in

        // Functions gives binary data from json url using urlSession

        Themes.sharedInstance.dismissProgress()
        if let datas = data {

          if let value = String(data: datas, encoding: String.Encoding.ascii) {

            if let jsonData = value.data(using: String.Encoding.utf8) {

              completion(jsonData,error)
            }
          }

        } else {
          completion(data,error)
        }
        }.resume()
  }
}
