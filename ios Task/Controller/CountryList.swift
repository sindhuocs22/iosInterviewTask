//
//  CountryList.swift
//  ios Task
//
//  Created by INFOSYS on 19/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

class CountryList: UIViewController, CountryListViewModelDelegate {

  var tableCountry = UITableView()
  var countryListViewModel = CountryListVM()
  var countryListDS = CountryListTableDataSource()
  var countryListDele = CountryListTableDelegate()

  var refreshControl = UIRefreshControl()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupDesign()
  }

  // MARK: Design Setup

  func setupDesign() {

    countryListViewModel.delegate = self
    self.createSubViews()
    self.setupConstraints()
    tableCountry.register(CountryListCell.self, forCellReuseIdentifier: "Cell") //Register the cell for tableview
    refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    tableCountry.addSubview(refreshControl)
    //API calls in ViewModel Class
    countryListViewModel.sendRequestToGetCountryData(parentController: self, table: self.tableCountry)

  }
  func createSubViews() {

    self.navigationItem.title = NSLocalizedString("navigation_title", comment: "")
    tableCountry.translatesAutoresizingMaskIntoConstraints = false
    tableCountry.estimatedRowHeight = 80
    tableCountry.separatorStyle = .none
    tableCountry.delegate = countryListDele
    tableCountry.dataSource = countryListDS
    self.view.addSubview(tableCountry)
  }
  func setupConstraints() {

    tableCountry.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
    tableCountry.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    tableCountry.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    tableCountry.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true

  }
  // MARK: Custom protocols
  func reloadData(array: [Rows]?) {
    //Receiving values from viewmodel class and passing to datasource class
    self.countryListDS.arrayCountryData = array
    self.tableCountry.reloadData()
    self.refreshControl.endRefreshing()
  }
  func updateNavigationTitle(title: String) {
    //after getting API response navigation title gets updated
    self.navigationItem.title = title
  }
  // MARK: Actions
  @objc func refresh(sender: AnyObject) {

    //Refresh method to initiate API call
    countryListViewModel.sendRequestToGetCountryData(parentController: self, table: self.tableCountry)
  }
}
