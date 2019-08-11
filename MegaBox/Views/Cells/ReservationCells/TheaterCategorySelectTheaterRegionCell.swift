//
//  TheaterCategorySelectTheaterRegionCell.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterRegionCell: UITableViewCell {
  static let identifier = "TheaterCategorySelectTheaterRegionCell"
  
  let regionName: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let guideLineView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.appColor(.defaultGrayColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupLabel()
  }
  
  private func setupLabel() {
    let margin: CGFloat = 10
    self.addSubview(regionName)
    regionName.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
    regionName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2).isActive = true
    regionName.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    regionName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin).isActive = true
    
    self.addSubview(guideLineView)
    guideLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    guideLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    guideLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    guideLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
