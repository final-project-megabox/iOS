//
//  ShortMenuView.swift
//  MegaBox
//
//  Created by Fury on 06/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ShortMenuView: UIView {
  
  private var imageStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  private var textStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  private let theaterImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "main_middle_theater_icon"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    return button
  }()
  
  private let theaterTextLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "영화관", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 10, alignment: .center)
    return label
  }()
  
  private let discountCardImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "main_middle_card_icon"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    return button
  }()
  
  private let discountCardTextLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "할인카드", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 10, alignment: .center)
    return label
  }()
  
  private let storeImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "main_middle_store_icon"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    return button
  }()
  
  private let storeTextLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "스토어", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 10, alignment: .center)
    return label
  }()
  
  private let photoCardImageButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "main_middle_photocard_icon"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    return button
  }()
  
  private let photoCardTextLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "포토카드", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 10, alignment: .center)
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
    imageStackView = UIStackView(arrangedSubviews: [theaterImageButton, discountCardImageButton, storeImageButton, photoCardImageButton])
    imageStackView.translatesAutoresizingMaskIntoConstraints = false
    imageStackView.axis = .horizontal
    imageStackView.alignment = .center
    imageStackView.distribution = .fillEqually
    imageStackView.spacing = 13
    
    textStackView = UIStackView(arrangedSubviews: [theaterTextLabel, discountCardTextLabel, storeTextLabel, photoCardTextLabel])
    textStackView.translatesAutoresizingMaskIntoConstraints = false
    textStackView.axis = .horizontal
    textStackView.alignment = .center
    textStackView.distribution = .fillEqually
    textStackView.spacing = 13

    addSubViews()
    autoLayout()
  }
  
  private func addSubViews() {
    self.addSubview(imageStackView)
    self.addSubview(textStackView)
    imageStackView.addSubview(theaterImageButton)
    textStackView.addSubview(theaterTextLabel)
    imageStackView.addSubview(discountCardImageButton)
    textStackView.addSubview(discountCardTextLabel)
    imageStackView.addSubview(storeImageButton)
    textStackView.addSubview(storeTextLabel)
    imageStackView.addSubview(photoCardImageButton)
    textStackView.addSubview(photoCardTextLabel)
  }
  
  private func autoLayout() {
    let margin: CGFloat = 10
    NSLayoutConstraint.activate([
      imageStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
      imageStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 5),
      imageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 5),

      textStackView.topAnchor.constraint(equalTo: imageStackView.bottomAnchor),
      textStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 5),
      textStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 5),
      textStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin * 2),
      textStackView.heightAnchor.constraint(equalTo: imageStackView.heightAnchor, multiplier: 0.3),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
