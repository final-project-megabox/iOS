//
//  EventCollectionCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class EventCollectionCell: UICollectionViewCell {
  static let identifier = "EventCollectionCell"
  
  let thumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let thumbnailTextLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "메가박스이벤트", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 13, alignment: .center)
    label.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    label.alpha = 0.95
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private var eventView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    view.layer.borderWidth = 0.5
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleNameLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "스파이더맨: 파 프롬 홈", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 14, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let subLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "예매율 47.6 %", color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), fontSize: 12, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupProperties()
  }
  
  private func setupProperties() {
    // thumbnail Image 비율로 hieght 구하기
    let margin: CGFloat = 10
    let thumbnailImageHeight = ((UIScreen.main.bounds.width - 60) * 380) / 648
    
    contentView.addSubview(thumbnailImage)
    thumbnailImage.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    thumbnailImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin / 2).isActive = true
    thumbnailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    thumbnailImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    thumbnailImage.heightAnchor.constraint(equalToConstant: thumbnailImageHeight).isActive = true
    
    thumbnailImage.addSubview(thumbnailTextLabel)
    thumbnailTextLabel.topAnchor.constraint(equalTo: thumbnailImage.topAnchor).isActive = true
    thumbnailTextLabel.trailingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor).isActive = true
    thumbnailTextLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    contentView.addSubview(eventView)
    eventView.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor).isActive = true
    eventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    eventView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    eventView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
    
    eventView.addSubview(titleNameLabel)
    titleNameLabel.topAnchor.constraint(equalTo: eventView.topAnchor, constant: margin).isActive = true
    titleNameLabel.leadingAnchor.constraint(equalTo: eventView.leadingAnchor, constant: margin).isActive = true
    
    eventView.addSubview(subLabel)
    subLabel.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor, constant: margin / 2).isActive = true
    subLabel.leadingAnchor.constraint(equalTo: eventView.leadingAnchor, constant: margin).isActive = true
    subLabel.heightAnchor.constraint(equalTo: titleNameLabel.heightAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
