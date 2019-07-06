//
//  ShortMenuView.swift
//  MegaBox
//
//  Created by Fury on 06/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ShortMenuView: UIView {
  
  private var shortMenuStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private let theaterImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    return button
  }()
  
  private let discountCardImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    return button
  }()
  
  private let storeImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    return button
  }()
  
  private let photoCardImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupStackView()
  }
  
  private func setupStackView() {
    shortMenuStack = UIStackView(arrangedSubviews: [theaterImageButton, discountCardImageButton, storeImageButton, photoCardImageButton])
    
    shortMenuStack.axis = .horizontal
    shortMenuStack.alignment = .center
    shortMenuStack.distribution = .fillEqually
    
    self.addSubview(shortMenuStack)
    
    NSLayoutConstraint.activate([
      shortMenuStack.topAnchor.constraint(equalTo: self.topAnchor),
      shortMenuStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      shortMenuStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      shortMenuStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
