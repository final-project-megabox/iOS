//
//  PaymentView.swift
//  MegaBox
//
//  Created by Fury on 05/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class PaymentView: UIView {
  
  private let menuTitleView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let menuTitleDismissButton: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(touchUpDismissButton), for: .touchUpInside)
    button.setImage(#imageLiteral(resourceName: "purpleCancel_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let menuTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "결제"
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let menuTitleRefreshButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(touchUpRefreshButton(_:)), for: .touchUpInside)
    button.setImage(#imageLiteral(resourceName: "purpleCancel_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let paymentScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private let topView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.284535408, green: 0.2828498483, blue: 0.2858348787, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let movieGradeImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "test", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 13, alignment: .left)
    label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieTypeLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "test", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 11, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieThumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let dateLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "test", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 10, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let screenLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "test", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 10, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let personLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "test", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 10, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let seatLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "test", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 10, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  @objc private func touchUpRefreshButton(_ sender: UIButton) {
    
  }
  
  @objc private func touchUpDismissButton() {
    
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    
    self.addSubview(menuTitleView)
    menuTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    menuTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    menuTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    menuTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    menuTitleView.addSubview(menuTitleLabel)
    menuTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
    menuTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    menuTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    menuTitleView.addSubview(menuTitleDismissButton)
    menuTitleDismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
    menuTitleDismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    menuTitleDismissButton.centerYAnchor.constraint(equalTo: menuTitleLabel.centerYAnchor).isActive = true
    
    menuTitleView.addSubview(menuTitleRefreshButton)
    menuTitleRefreshButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.5).isActive = true
    menuTitleRefreshButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
    menuTitleRefreshButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    menuTitleRefreshButton.centerYAnchor.constraint(equalTo: menuTitleLabel.centerYAnchor).isActive = true
    
    self.addSubview(paymentScrollView)
    paymentScrollView.topAnchor.constraint(equalTo: menuTitleView.bottomAnchor).isActive
     = true
    paymentScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    paymentScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    paymentScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    
    paymentScrollView.addSubview(topView)
    topView.topAnchor.constraint(equalTo: paymentScrollView.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    topView.bottomAnchor.constraint(equalTo: paymentScrollView.bottomAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
    topView.addSubview(movieGradeImage)
    movieGradeImage.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
    movieGradeImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
    movieGradeImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    movieGradeImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    topView.addSubview(movieTitleLabel)
    movieTitleLabel.centerYAnchor.constraint(equalTo: movieGradeImage.centerYAnchor).isActive = true
    movieTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive
     = true
    
    topView.addSubview(movieTypeLabel)
    movieTypeLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
    movieTypeLabel.centerXAnchor.constraint(equalTo: movieTitleLabel.centerXAnchor).isActive = true
    
    topView.addSubview(movieThumbnailImage)
    movieThumbnailImage.topAnchor.constraint(equalTo: movieTypeLabel.bottomAnchor).isActive = true
    movieThumbnailImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
