//
//  TheaterCategoryCollectionCell.swift
//  MegaBox
//
//  Created by Fury on 23/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryCollectionCell: UICollectionViewCell {
  static let identifier = "TheaterCategoryCollectionCell"
  
  private let startTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "10:15"
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let endTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "~12:08"
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let remainSeats: UILabel = {
    let label = UILabel()
    label.text = "14석"
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    self.layer.borderWidth = 0.5
    self.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    setupProperties()
  }
  
  private func setupProperties() {
    contentView.addSubview(startTimeLabel)
    startTimeLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    startTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    startTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    contentView.addSubview(endTimeLabel)
    endTimeLabel.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor).isActive = true
    endTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    endTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    contentView.addSubview(remainSeats)
    remainSeats.topAnchor.constraint(equalTo: endTimeLabel.bottomAnchor).isActive = true
    remainSeats.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    remainSeats.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    remainSeats.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
