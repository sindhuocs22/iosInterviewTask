//
//  ios_TaskTests.swift
//  ios TaskTests
//
//  Created by INFOSYS on 18/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import XCTest
@testable import ios_Task

class IOSTaskTests: XCTestCase {

  func testInitMyTable() {
    let vc = CountryList()
    XCTAssertNotNil(vc.tableCountry)

  }
  func testLoadTableViewWithDataSource() {
    let vc = CountryList()
    XCTAssertTrue(vc.tableCountry.dataSource?.isEqual(vc) ?? true)
  }

  func testLoadTableViewWithDelegate() {
    let vc = CountryList()
    XCTAssertTrue(vc.tableCountry.dataSource?.isEqual(vc) ?? true)
  }
  // MARK: - Checks model
  //Below methods checks json response matches with dummy data
  func testDecodableDatawithDummyValues() {
    guard let url = URL(string: Constants.Baseurl) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
      guard let dataResponse = data,
        error == nil else {
          print(error?.localizedDescription ?? "Response Error")
          return }
      do {
        //here dataResponse received from a network request
        if let value = String(data: dataResponse, encoding: String.Encoding.ascii) {
          if let jsonData = value.data(using: String.Encoding.utf8) {
            let decodedData = try JSONDecoder().decode(CountryModel.self, from: jsonData)
            XCTAssertEqual(decodedData.title, "About Canada")
            XCTAssertLessThan(decodedData.rows?.count ?? 0, 0)
          }
        }
      } catch let parsingError {
        print("Error", parsingError)
      }
    }
    task.resume()
  }
}
