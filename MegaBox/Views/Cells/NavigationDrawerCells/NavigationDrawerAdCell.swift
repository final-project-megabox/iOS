//
//  NavigationDrawerAdCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class NavigationDrawerAdCell: UICollectionViewCell {
  static let identifier = "NavigationDrawerAdCell"
  
  private let adImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "spiderman_thumbnail")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupAdImageView()
    
  }
  
  private func setupAdImageView() {
    contentView.addSubview(adImageView)
    adImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    adImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    adImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    adImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
