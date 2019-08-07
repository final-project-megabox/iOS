//
//  DateListHeaderCell.swift
//  MegaBox
//
//  Created by Fury on 06/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class DateListHeaderCell: UITableViewCell {
  static let identifier = "DateListHeaderCell"
  
  private let yearLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.labelSetup(text: "", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 13, alignment: .center)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let monthLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.labelSetup(text: "", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 18, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 18, weight: .black)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupProperties()
  }
  
  func cellCongire(_ yearAndMonth: String) {
    let dateArr = yearAndMonth.split(separator: "-")
    yearLabel.text = String(dateArr[0])
    monthLabel.text = String(dateArr[1])
  }
  
  private func setupProperties() {
    contentView.addSubview(yearLabel)
    yearLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    yearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    yearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    contentView.addSubview(monthLabel)
    monthLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor).isActive = true
    monthLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    monthLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    monthLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
