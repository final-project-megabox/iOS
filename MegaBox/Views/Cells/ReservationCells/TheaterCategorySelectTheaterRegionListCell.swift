//
//  TheaterCategorySelectTheaterRegionListCell.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterRegionListCell: UITableViewCell {
  static let identifier = "TheaterCategorySelectTheaterRegionListCell"
  
  let regionListName: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupLabel()
  }
  
  private func setupLabel() {
    let margin: CGFloat = 10
    self.addSubview(regionListName)
    regionListName.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
    regionListName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
    regionListName.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    regionListName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
