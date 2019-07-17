//
//  TheaterCategoryAdCollectionCell.swift
//  MegaBox
//
//  Created by Fury on 17/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryAdCollectionCell: UICollectionViewCell {
  static let identifier = "TheaterCategoryAdCollectionCell"
  
  let adImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  private func setupProperties() {
    contentView.addSubview(adImage)
    adImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    adImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    adImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    adImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
