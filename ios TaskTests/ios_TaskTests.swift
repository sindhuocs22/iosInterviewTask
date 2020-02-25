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
    XCTAssertTrue(vc.tableCountry.dataSource?.isEqual(vc.countryListDS) ?? true)
  }

  func testLoadTableViewWithDelegate() {
    let vc = CountryList()
    XCTAssertTrue(vc.tableCountry.dataSource?.isEqual(vc.countryListDele) ?? true)
  }

}
