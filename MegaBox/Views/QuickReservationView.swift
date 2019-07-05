//
//  QuickReservationView.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class QuickReservationView: UIView {
  
  private let topView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let cancelButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "cancel_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  //fa_left
  private let faleftButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "fa_left"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let theaterTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관별 예매"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let theaterSubTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "가고 싶은 영화관을\n먼저 선택할 수 있어요!"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //fa_right
  private let farightButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "fa_right"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관별 예매"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieSubTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "보고 싶은 영화를\n먼저 선택할 수 있어요!"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let bottomImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "bottom_ad")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  //#392074
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    setupProperties()
  }
  
  private func setupProperties() {
    addSubViews()
    autoLayout()
  }
  
  private func addSubViews() {
    self.addSubview(topView)
    topView.addSubview(cancelButton)
    topView.addSubview(faleftButton)
    topView.addSubview(theaterTitleLabel)
    topView.addSubview(theaterSubTitleLabel)
    topView.addSubview(farightButton)
    topView.addSubview(movieTitleLabel)
    topView.addSubview(movieSubTitleLabel)
    self.addSubview(bottomImageView)
  }
  
  private func autoLayout() {
    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: self.topAnchor),
      topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      topView.heightAnchor.constraint(equalToConstant: 400),
      
      bottomImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      bottomImageView.heightAnchor.constraint(equalToConstant: 200),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
