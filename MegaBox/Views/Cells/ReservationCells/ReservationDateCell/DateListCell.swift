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
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.labelSetup(text: "", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 16, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 16, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let bottomLineView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupProperties()
  }
  
  func cellCongire(_ timeText: String) {
    if timeText.contains("토") {
      dateLabel.text = timeText
      dateLabel.textColor = #colorLiteral(red: 0, green: 0.01932368055, blue: 1, alpha: 1)
    } else if timeText.contains("일") {
      dateLabel.text = timeText
      dateLabel.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    }
    dateLabel.text = timeText
  }
  
  private func setupProperties() {
    contentView.addSubview(dateLabel)
    dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
//    contentView.addSubview(bottomLineView)
//    bottomLineView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
//    bottomLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//    bottomLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//    bottomLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
