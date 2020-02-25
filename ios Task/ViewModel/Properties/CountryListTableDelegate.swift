//
//  CountryListTableDelegate.swift
//  ios Task
//
//  Created by INFOSYS on 24/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

class CountryListTableDelegate: NSObject, UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    return UITableView.automaticDimension
  }
}
