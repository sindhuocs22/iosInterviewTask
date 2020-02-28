//
//  CountryListModel.swift
//  ios Task
//
//  Created by INFOSYS on 19/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import Foundation
struct CountryModel: Codable {
  let title: String?
  let rows: [Rows]?

  enum CodingKeys:  CodingKey {

    case title
    case rows
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    rows = try values.decodeIfPresent([Rows].self, forKey: .rows)
  }

}
struct Rows: Codable {
  let title: String?
  let description: String?
  let imageHref: String?

  enum CodingKeys: CodingKey {

    case title
    case description
    case imageHref
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    description = try values.decodeIfPresent(String.self, forKey: .description)
    imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref)
  }

}
