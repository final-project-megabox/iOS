//
//  AdView.swift
//  MegaBox
//
//  Created by Fury on 06/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class AdView: UIView {
    let adImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupAdImageView()
  }
  
  private func setupAdImageView() {
    self.addSubview(adImage)
    NSLayoutConstraint.activate([
      adImage.topAnchor.constraint(equalTo: self.topAnchor),
      adImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      adImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      adImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
