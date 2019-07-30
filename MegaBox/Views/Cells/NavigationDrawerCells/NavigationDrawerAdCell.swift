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
  
  let bgImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "ad_slid_1")
    imageView.alpha = 0.1
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let adImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "ad_slid_1")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupAdImageView()
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  private func setupAdImageView() {
    contentView.addSubview(bgImageView)
    bgImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    bgImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    bgImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    bgImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    contentView.addSubview(adImageView)
    adImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    adImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    adImageView.widthAnchor.constraint(equalToConstant: (contentView.frame.height * 828) / 1280).isActive = true
    adImageView.heightAnchor.constraint(equalToConstant: (contentView.frame.width * 1280) / 828).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
