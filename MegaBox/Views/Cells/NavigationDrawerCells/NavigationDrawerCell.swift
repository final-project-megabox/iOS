//
//  NavigationDrawerCell.swift
//  MegaBox
//
//  Created by Fury on 11/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class NavigationDrawerCell: UICollectionViewCell {
  static let identifier = "NavigationDrawerCell"
  private var naviDrawerTopStack = UIStackView()
  
  private let guideView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let naviDrawerHomeButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_home_nor"), for: .normal)
    return button
  }()
  
  private let naviDrawerDivisionLine: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    return view
  }()
  
  private let naviDrawerNoticeButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_notice_nor"), for: .normal)
    return button
  }()
  
  private let naviDrawerSettingButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_setting_nor"), for: .normal)
    return button
  }()
  
  private let naviDrawerBarcodeButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "menu_slide_barcode_nor"), for: .normal)
    return button
  }()
  
  private let naviDrawerCancelButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_close_nor"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.layer.borderWidth = 0.5
    button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupStackView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupAdImageView()
  }
  
  private func setupStackView() {
    naviDrawerTopStack = UIStackView(arrangedSubviews: [naviDrawerHomeButton, naviDrawerDivisionLine, naviDrawerNoticeButton, naviDrawerSettingButton, naviDrawerBarcodeButton])
    naviDrawerTopStack.translatesAutoresizingMaskIntoConstraints = false
    naviDrawerTopStack.axis = .horizontal
    naviDrawerTopStack.alignment = .leading
    naviDrawerTopStack.distribution = .fillEqually
    naviDrawerTopStack.spacing = 8
  }
  
  private func setupAdImageView() {
    contentView.addSubview(guideView)
    guideView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    guideView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    guideView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    guideView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 1.5).isActive = true
    
    guideView.addSubview(naviDrawerTopStack)
    naviDrawerTopStack.topAnchor.constraint(equalTo: guideView.topAnchor).isActive = true
    naviDrawerTopStack.leadingAnchor.constraint(equalTo: guideView.leadingAnchor).isActive = true
    print(guideView.frame.width)
    naviDrawerTopStack.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
    naviDrawerTopStack.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    guideView.addSubview(naviDrawerCancelButton)
    naviDrawerCancelButton.topAnchor.constraint(equalTo: guideView.topAnchor).isActive = true
    naviDrawerCancelButton.trailingAnchor.constraint(equalTo: guideView.trailingAnchor).isActive = true
    naviDrawerCancelButton.heightAnchor.constraint(equalTo: naviDrawerTopStack.heightAnchor).isActive = true
    
    guideView.addSubview(naviDrawerCancelButton)
    naviDrawerCancelButton.topAnchor.constraint(equalTo: guideView.topAnchor).isActive = true
    naviDrawerCancelButton.trailingAnchor.constraint(equalTo: guideView.trailingAnchor).isActive = true
    naviDrawerCancelButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    naviDrawerCancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    guideView.addSubview(loginButton)
    loginButton.topAnchor.constraint(equalTo: naviDrawerTopStack.bottomAnchor
      ).isActive = true
    loginButton.centerXAnchor.constraint(equalTo: guideView.centerXAnchor).isActive = true
    loginButton.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4.5).isActive = true
    loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
