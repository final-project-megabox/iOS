//
//  MainShortMenuCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainShortMenuCell: UITableViewCell {
  static let identifier = "ShortMenuCell"
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
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
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupStackView()
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    makeAutoLayout()
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
  }
  
  private func makeAutoLayout() {
    let margin: CGFloat = 10
    contentView.addSubview(guideBGView)
    guideBGView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    guideBGView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    guideBGView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    guideBGView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    guideBGView.addSubview(imageStackView)
    imageStackView.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin).isActive = true
    imageStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 5).isActive = true
    imageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 5).isActive = true
    
    guideBGView.addSubview(textStackView)
    textStackView.topAnchor.constraint(equalTo: imageStackView.bottomAnchor).isActive = true
    textStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 5).isActive = true
    textStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 5).isActive = true
    textStackView.bottomAnchor.constraint(equalTo: guideBGView.bottomAnchor, constant: -margin * 2).isActive = true
    textStackView.heightAnchor.constraint(equalTo: imageStackView.heightAnchor, multiplier: 0.3).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
