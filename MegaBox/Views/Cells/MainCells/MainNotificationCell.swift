//
//  MainNotificationCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainNotificationCell: UITableViewCell {
  static let identifier = "MainNotificationCell"
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "공지사항", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 16, alignment: .left)
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let plusButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_more_btn"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let notificationText: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "[광주하남] 주차장 시스템 변경 안내", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 14, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let notificationDateText: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "2019.07.23", color: #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1), fontSize: 13, alignment: .right)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(guideBGView)
    guideBGView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin).isActive = true
    guideBGView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    guideBGView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    guideBGView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    guideBGView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideBGView.addSubview(plusButton)
    plusButton.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    plusButton.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin * 2).isActive = true
    plusButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
    plusButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    guideBGView.addSubview(notificationText)
    notificationText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin * 2).isActive = true
    notificationText.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor,constant: margin * 2).isActive = true

    guideBGView.addSubview(notificationDateText)
    notificationDateText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin * 2).isActive = true
    notificationDateText.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor,constant: -margin * 2).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
