//
//  CountryListTableDataSource.swift
//  ios Task
//
//  Created by INFOSYS on 24/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

class CountryListTableDataSource: NSObject, UITableViewDataSource {

  var arrayCountryData: [Rows]?

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    if arrayCountryData?.count == 0 {

      //Display's No Data view if table is empty
      tableView.setEmptyMessage(NSLocalizedString("no_data", comment: ""))

    } else {

      //Display's tableview with Data
      tableView.restore()
    }
    return arrayCountryData?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    var cell: CountryListCell? = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CountryListCell
    cell?.selectionStyle = .none
    if cell == nil {
      cell = CountryListCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
    }
    // Below method for urwrapping nil values
    if let object = arrayCountryData?[indexPath.row] {
      let title = "\(object.title ?? "")"
      let description = "\(object.description ?? "")"
      let imageUrl = "\(object.imageHref ?? "")"
      cell?.labelTitle.text = title
      cell?.labelDescription.text = description
      if imageUrl != "" {
        cell?.configureWith(urlString: imageUrl) // converting image url into image
      } else {
        cell?.imageIcon.image = UIImage.init(named: "placeholder")

      }

    }
    return cell!
  }

}
