//
//  DateListCell.swift
//  MegaBox
//
//  Created by Fury on 05/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class DateListCell: UITableViewCell {
  static let identifier = "DateListCell"
  
  private let dateLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupProperties()
  }
  
  private func setupProperties() {
    contentView.addSubview(dateLabel)
    dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
