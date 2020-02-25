//
//  CountryListCell.swift
//  ios Task
//
//  Created by INFOSYS on 19/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

class CountryListCell: UITableViewCell {

  var viewBg = UIView()
  var imageIcon = UIImageView()
  var labelTitle = UILabel()
  var labelDescription = UILabel()
  var viewSeperator = UIView()
  private var task: URLSessionDataTask?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  required init(coder aDecoder: NSCoder) {

    super.init(coder: aDecoder)!
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.createSubViews()
    self.setupConstraints()

  }
  // MARK: - Design Setup
  func createSubViews() {

    //Parent view
    viewBg.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(viewBg)

    //imageview inside the parentview
    imageIcon.translatesAutoresizingMaskIntoConstraints = false
    viewBg.addSubview(imageIcon)

    //label to denote title
    labelTitle.translatesAutoresizingMaskIntoConstraints = false
    labelTitle.font = UIFont.boldSystemFont(ofSize: 15)
    labelTitle.numberOfLines = 0
    viewBg.addSubview(labelTitle)

    //label to denote description
    labelDescription.translatesAutoresizingMaskIntoConstraints = false
    labelDescription.font = UIFont.systemFont(ofSize: 13)
    labelDescription.numberOfLines = 0
    viewBg.addSubview(labelDescription)

    //Removed default seperator line created custom line
    viewSeperator.translatesAutoresizingMaskIntoConstraints = false
    viewSeperator.backgroundColor = .lightGray
    viewBg.addSubview(viewSeperator)

  }
  func setupConstraints() {

    //Anchor constraints used to give same layout for all the model of iphones

    viewBg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    viewBg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    viewBg.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    viewBg.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
    viewBg.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true

    imageIcon.leadingAnchor.constraint(equalTo: viewBg.leadingAnchor, constant: 10).isActive = true
    imageIcon.widthAnchor.constraint(equalToConstant: 100).isActive = true
    imageIcon.heightAnchor.constraint(equalToConstant: 100).isActive = true
    imageIcon.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 10).isActive = true

    labelTitle.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 10).isActive = true
    labelTitle.trailingAnchor.constraint(equalTo: viewBg.trailingAnchor, constant: -10).isActive = true
    labelTitle.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 10).isActive = true

    labelDescription.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 10).isActive = true
    labelDescription.trailingAnchor.constraint(equalTo: viewBg.trailingAnchor, constant: -10).isActive = true
    labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10).isActive = true
    labelDescription.bottomAnchor.constraint(lessThanOrEqualTo: viewSeperator.bottomAnchor, constant: -10).isActive = true

    viewSeperator.leadingAnchor.constraint(equalTo: viewBg.leadingAnchor, constant: 0).isActive = true
    viewSeperator.trailingAnchor.constraint(equalTo: viewBg.trailingAnchor, constant: 0).isActive = true
    viewSeperator.heightAnchor.constraint(greaterThanOrEqualToConstant: 0.5).isActive = true
    viewSeperator.bottomAnchor.constraint(equalTo: viewBg.bottomAnchor, constant: 0).isActive = true

  }

  // Called in cellForRowAt / cellForItemAt
  func configureWith(urlString: String) {
    if task == nil {
      // Ignore calls when reloading
      task = imageIcon.downloadImage(from: urlString) // Initially images get downloaded and stored to cache memory,whenever table gets reloaded images will be taken from cache.
    }
  }
  override func prepareForReuse() {
    super.prepareForReuse()

    //it will call whenever cell gets allocated
    task?.cancel()
    task = nil
    imageIcon.image = nil
  }
}
