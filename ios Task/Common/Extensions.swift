//
//  Extensions.swift
//  ios Task
//
//  Created by INFOSYS on 20/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

  func downloadImage(from imgURL: String) -> URLSessionDataTask? {
    guard let url = URL(string: imgURL) else { return nil }

    // set initial image to nil so it doesn't use the image from a reused cell
    image = nil

    // check if the image is already in the cache
    if let imageToCache = imageCache.object(forKey: imgURL as NSString) {
      self.image = imageToCache
      return nil
    } else {
      self.image = UIImage.init(named: "placeholder")

    }

    // download the image asynchronously
    let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
      if let err = error {
        print(err)
        return
      }

      DispatchQueue.main.async {
        // create UIImage
        if let imagedata = data {
          if  let imageToCache = UIImage(data: imagedata) {
            // add image to cache
            imageCache.setObject(imageToCache, forKey: imgURL as NSString)
            self.image = imageToCache
          } else {
            self.image = UIImage.init(named: "placeholder")
          }
        }

      }
    }
    task.resume()
    return task
  }
  }

extension UITableView {

  func setEmptyMessage(_ message: String) {
    let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
    messageLabel.text = message
    messageLabel.textColor = .black
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.font = UIFont.systemFont(ofSize: 11)
    messageLabel.sizeToFit()

    self.backgroundView = messageLabel
  }

  func restore() {
    self.backgroundView = nil
  }
}
