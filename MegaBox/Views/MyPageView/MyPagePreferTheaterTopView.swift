//
//  MyPagePreferTheaterTopView.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPagePreferTheaterTopView: UIView {
  
  var delegate: MyPagePreferTheaterTopViewDelegate?
  
  private let topView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "선호영화관 설정"
    label.textColor = UIColor.appColor(.darkBgColor)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let titleLabelBottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.appColor(.defaultGrayColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let menuButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "common_btn_topbar_menu"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "common_btn_topbar_prev2"), for: .normal)
    button.addTarget(self, action: #selector(didTapDismissButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  @objc func didTapDismissButton(_ sender: UIButton) {
    delegate?.touchUpDismissButton(sender: sender)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupMyPageTopView()
  }

  
  private func setupMyPageTopView() {
    addSubview(topView)
    topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    topView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
    titleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    
    addSubview(titleLabelBottomLine)
    titleLabelBottomLine.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    titleLabelBottomLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    titleLabelBottomLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    titleLabelBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    topView.addSubview(menuButton)
    menuButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
    menuButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10).isActive = true
    menuButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    menuButton.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.1).isActive = true
    
    topView.addSubview(dismissButton)
    dismissButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
    dismissButton.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor).isActive = true
    dismissButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    dismissButton.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.1).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
