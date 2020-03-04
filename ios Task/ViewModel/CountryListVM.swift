//
//  CountryListVM.swift
//  ios Task
//
//  Created by INFOSYS on 19/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

// MARK: protocol created
protocol CountryListViewModelDelegate: class {

  func reloadData(array: [Rows]?)
  func updateNavigationTitle(title: String)
  func showNetworkError()
  func showResponseError()

}

class CountryListVM: NSObject {

  weak var delegate: CountryListViewModelDelegate?

  func sendRequestToGetCountryData() {

    //API Call

    //Below line checks whether Network is available or not

    if Reachability.isConnectedToNetwork() {

    URLHandler.sharedInstance.sendRequestToGetAPICall { (data,_) in

      //Here data is Encoded values with binary data, below method used to decode the original json by using Model class
      if let responseData = data {
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(CountryModel.self, from: responseData)
        if let array = decodedData?.rows {
          DispatchQueue.main.async {
            //update the UI in main queue
            self.delegate?.updateNavigationTitle(title: decodedData?.title ?? "")
            self.delegate?.reloadData(array: array)
          }
        }

      } else {
        DispatchQueue.main.async {
          //if response is failure error will show
          self.delegate?.showResponseError()
        }
      }
    }

  } else {

      //Shows error alert if no network availble
      self.delegate?.showNetworkError()
    }
  }
}
