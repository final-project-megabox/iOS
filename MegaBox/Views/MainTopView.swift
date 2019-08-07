//
//  MainTopView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol MainTopViewDelegate: class {
  func openQuickReservationView()
  func openNavigationDrawerView()
}

class MainTopView: UIView {
  // MARK: topProperties
  var delegate: MainTopViewDelegate?
  
  let topMediaVisualTopView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.alpha = 0.3
    view.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let hamburgerMenu: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_top_menu_white_btn"), for: .normal)
    button.addTarget(self, action: #selector(hamburgerMenuButtonDidTpaaed), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let titleImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "main_top_logo_white")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let quickReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("빠른예매", for: .normal)
    button.addTarget(self, action: #selector(quickReservationButtonDidTapped), for: .touchUpInside)
    button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 2
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  @objc private func hamburgerMenuButtonDidTpaaed() {
    delegate?.openNavigationDrawerView()
  }
  
  @objc private func quickReservationButtonDidTapped() {
    delegate?.openQuickReservationView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    self.addSubview(topMediaVisualTopView)
    topMediaVisualTopView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    topMediaVisualTopView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    topMediaVisualTopView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    
    self.addSubview(hamburgerMenu)
    hamburgerMenu.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
    hamburgerMenu.centerYAnchor.constraint(equalTo: topMediaVisualTopView.centerYAnchor).isActive = true
    hamburgerMenu.heightAnchor.constraint(equalToConstant: 20).isActive = true
    hamburgerMenu.widthAnchor.constraint(equalToConstant: 30).isActive = true
    
    self.addSubview(titleImage)
    titleImage.leadingAnchor.constraint(equalTo: hamburgerMenu.trailingAnchor, constant: margin * 2).isActive = true
    titleImage.centerYAnchor.constraint(equalTo: topMediaVisualTopView.centerYAnchor).isActive = true
    titleImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    titleImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
    
    self.addSubview(quickReservationButton)
    quickReservationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
    quickReservationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
    quickReservationButton.centerYAnchor.constraint(equalTo: topMediaVisualTopView.centerYAnchor).isActive = true
    quickReservationButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
