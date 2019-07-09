//
//  MovieReservationCell.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieReservationCell: UICollectionViewCell {
  static let identifier = "MovieReservationCell"
  
  private let thumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "spiderman_thumbnail")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let thumbnailNumLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "1", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 5, alignment: .center)
    label.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.1607843137, blue: 0.3764705882, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let mxImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let titleNameLabel: UILabel = {
    let label = UILabel()
    label.text = "스파이더맨: 파 프롬 홈"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let subLabel: UILabel = {
    let label = UILabel()
    label.text = "예매율 47.6 %"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    initializeProperties()
  }
  
  private func initializeProperties() {
    addContentViews()
    autoLayout()
  }
  
  private func addContentViews() {
    contentView.addSubview(thumbnailImage)
    contentView.addSubview(titleNameLabel)
    contentView.addSubview(subLabel)
  }
  
  private func autoLayout() {
    NSLayoutConstraint.activate([
      thumbnailImage.topAnchor.constraint(equalTo: self.topAnchor),
      thumbnailImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      thumbnailImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      titleNameLabel.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor),
      titleNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      titleNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      subLabel.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor),
      subLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      subLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      subLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
