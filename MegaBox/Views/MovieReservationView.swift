//
//  MovieReservationView.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieReservationView: UIView {
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.labelConfigure("영화예매")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let plusButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "plus_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let divisionLine: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let movieReservationCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  private func setupProperties() {
    addSubViews()
    autoLayout()
  }
  
  private func addSubViews() {
    self.addSubview(titleLabel)
    self.addSubview(plusButton)
    self.addSubview(divisionLine)
    self.addSubview(movieReservationCollection)
  }
  
  private func autoLayout() {
    let margin: CGFloat = 10
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      
      plusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2),
      plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 2),
      
      divisionLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin),
      divisionLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      divisionLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 2),
      divisionLine.heightAnchor.constraint(equalToConstant: 0.5),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
