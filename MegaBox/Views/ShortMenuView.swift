//
//  ShortMenuView.swift
//  MegaBox
//
//  Created by Fury on 06/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ShortMenuView: UIView {
  
  private let theaterImageButton: UIButton = {
    let button = UIButton()
//    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let theaterTextLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let discountCardImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let discountCardTextLabel: UILabel = {
    let label = UILabel()
    label.text = "할인카드"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let storeImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let storeTextLabel: UILabel = {
    let label = UILabel()
    label.text = "스토어"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let photoCardImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "theater_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let photoCardTextLabel: UILabel = {
    let label = UILabel()
    label.text = "포토카드"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupStackView()
  }
  
  private func setupStackView() {
    addSubViews()
    autoLayout()
  }
  
  private func addSubViews() {
    self.addSubview(theaterImageButton)
    self.addSubview(theaterTextLabel)
    self.addSubview(discountCardImageButton)
    self.addSubview(discountCardTextLabel)
    self.addSubview(storeImageButton)
    self.addSubview(storeTextLabel)
    self.addSubview(photoCardImageButton)
    self.addSubview(photoCardTextLabel)
    
    theaterImageButton.backgroundColor = .red
  }
  
  private func autoLayout() {
    NSLayoutConstraint.activate([
      theaterImageButton.topAnchor.constraint(equalTo: self.topAnchor),
      theaterImageButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      theaterImageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      theaterImageButton.widthAnchor.constraint(equalToConstant: frame.width / 4),
      
      theaterTextLabel.topAnchor.constraint(equalTo: theaterImageButton.bottomAnchor),
      theaterTextLabel.centerXAnchor.constraint(equalTo: theaterImageButton.centerXAnchor),
      
      discountCardImageButton.topAnchor.constraint(equalTo: self.topAnchor),
      discountCardImageButton.leadingAnchor.constraint(equalTo: theaterImageButton.trailingAnchor),
      discountCardImageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      discountCardImageButton.widthAnchor.constraint(equalToConstant: frame.width / 4),
      
//      discountCardTextLabel.topAnchor.constraint(equalTo: discountCardImageButton.bottomAnchor),
//      discountCardTextLabel.centerXAnchor.constraint(equalTo: discountCardImageButton.centerXAnchor),
      
      storeImageButton.topAnchor.constraint(equalTo: self.topAnchor),
      storeImageButton.leadingAnchor.constraint(equalTo: discountCardImageButton.trailingAnchor),
      storeImageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      storeImageButton.widthAnchor.constraint(equalToConstant: frame.width / 4),

//      theaterTextLabel.topAnchor.constraint(equalTo: storeImageButton.bottomAnchor),
//      theaterTextLabel.centerXAnchor.constraint(equalTo: storeImageButton.centerXAnchor),

      photoCardImageButton.topAnchor.constraint(equalTo: self.topAnchor),
      photoCardImageButton.leadingAnchor.constraint(equalTo: storeImageButton.trailingAnchor),
      photoCardTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      photoCardImageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      photoCardImageButton.widthAnchor.constraint(equalToConstant: frame.width / 4),

//      photoCardTextLabel.topAnchor.constraint(equalTo: photoCardImageButton.bottomAnchor),
//      photoCardTextLabel.centerXAnchor.constraint(equalTo: photoCardImageButton.centerXAnchor),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
