//
//  MainAdCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainAdCell: UITableViewCell {
  static let identifier = "AdCell"
  
  let guideBGView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let adImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupAdImageView()
  }
  
  private func setupAdImageView() {
    let margin: CGFloat = 10
    contentView.addSubview(guideBGView)
    guideBGView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
    guideBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    guideBGView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    guideBGView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    guideBGView.addSubview(adImage)
    adImage.topAnchor.constraint(equalTo: guideBGView.topAnchor).isActive = true
    adImage.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor).isActive = true
    adImage.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor).isActive = true
    adImage.bottomAnchor.constraint(equalTo: guideBGView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
