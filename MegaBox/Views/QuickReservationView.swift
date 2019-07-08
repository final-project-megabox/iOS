//
//  QuickReservationView.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class QuickReservationView: UIView {
  
  let topView: UIView = {
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
    label.labelSetup(text: "영화관별 예매", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 14, alignment: nil)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let theaterSubTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "가고 싶은 영화관을\n먼저 선택할 수 있어요!", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 12, alignment: .center)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //fa_right
  private let farightButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "fa_right"), for: .normal)
    button.addTarget(self, action: #selector(didTapfarightButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "영화별 예매", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 14, alignment: nil)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieSubTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "보고 싶은 영화를\n먼저 선택할 수 있어요!", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 12, alignment: .center)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let bottomImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "bottom_ad")
    imageView.contentMode = .scaleToFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  var delegate: QuickReservationViewDelegate?
  
  //#392074
  
  override init(frame: CGRect) {
    super.init(frame: frame)
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
    let margin: CGFloat = 10
    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: self.topAnchor, constant: -250),
      topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      topView.heightAnchor.constraint(equalToConstant: 250),
      
      cancelButton.topAnchor.constraint(equalTo: topView.topAnchor),
      cancelButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
      cancelButton.heightAnchor.constraint(equalToConstant: 50),
      cancelButton.widthAnchor.constraint(equalToConstant: 50),
      
      faleftButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
      faleftButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: -margin),
      
      farightButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: -margin),
      farightButton.leadingAnchor.constraint(equalTo: faleftButton.trailingAnchor),
      farightButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
      farightButton.widthAnchor.constraint(equalTo: faleftButton.widthAnchor),
      
      theaterTitleLabel.topAnchor.constraint(equalTo: faleftButton.bottomAnchor, constant: margin),
      theaterTitleLabel.centerXAnchor.constraint(equalTo: faleftButton.centerXAnchor),
      
      theaterSubTitleLabel.topAnchor.constraint(equalTo: theaterTitleLabel.bottomAnchor, constant: margin),
      theaterSubTitleLabel.centerXAnchor.constraint(equalTo: faleftButton.centerXAnchor),
      
      movieTitleLabel.topAnchor.constraint(equalTo: farightButton.bottomAnchor, constant: margin),
      movieTitleLabel.centerXAnchor.constraint(equalTo: farightButton.centerXAnchor),
      
      movieSubTitleLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: margin),
      movieSubTitleLabel.centerXAnchor.constraint(equalTo: farightButton.centerXAnchor),
      
      bottomImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 130),
      bottomImageView.heightAnchor.constraint(equalToConstant: 130),
      ])
  }
  
  @objc private func didTapfarightButton(_ sender: UIButton) {
     delegate?.farightButtonDidSelected()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
