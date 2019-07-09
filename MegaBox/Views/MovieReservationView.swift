//
//  MovieReservationView.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieReservationView: UIView {
  
  private var indicatorBarWidthConstraint: NSLayoutConstraint!
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.labelConfigure("영화예매")
    label.labelSetup(text: "영화에매", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 16, alignment: .left)
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let plusButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "main_more_btn"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let divisionLine: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var movieReservationStack: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  private let boxOfficeLabel: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("박스오피스", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    return button
  }()
  
  private let showingScheduleLabel: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("상영예정", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let curationLabel: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("큐레이션", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let stageGreetingLabel: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("무대인사", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let indicatorBar: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let movieReservationCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  private func setupProperties() {
    movieReservationCollection.dataSource = self
    movieReservationCollection.delegate = self
    movieReservationCollection.register(MovieReservationCell.self, forCellWithReuseIdentifier: MovieReservationCell.identifier)
    setupStackView()
    addSubViews()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    autoLayout()
  }
  
  private func setupStackView() {
    movieReservationStack = UIStackView(arrangedSubviews: [boxOfficeLabel, showingScheduleLabel, curationLabel, stageGreetingLabel])
    
    movieReservationStack.translatesAutoresizingMaskIntoConstraints = false
    
    movieReservationStack.axis = .horizontal
    movieReservationStack.alignment = .leading
    movieReservationStack.distribution = .fill
    movieReservationStack.spacing = 20
    
  }
  
  private func addSubViews() {
    self.addSubview(titleLabel)
    self.addSubview(plusButton)
    self.addSubview(divisionLine)
    self.addSubview(movieReservationStack)
    self.addSubview(indicatorBar)
    self.addSubview(movieReservationCollection)
  }
  
  private func autoLayout() {
    let margin: CGFloat = 10
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      
      plusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2),
      plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 2),
      plusButton.widthAnchor.constraint(equalToConstant: 15),
      plusButton.heightAnchor.constraint(equalToConstant: 15),
      
      divisionLine.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: margin),
      divisionLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      divisionLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 2),
      divisionLine.heightAnchor.constraint(equalToConstant: 0.5),
      
      movieReservationStack.topAnchor.constraint(equalTo: divisionLine.bottomAnchor),
      movieReservationStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      
      indicatorBar.topAnchor.constraint(equalTo: movieReservationStack.bottomAnchor, constant: -3),
      indicatorBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      indicatorBar.heightAnchor.constraint(equalToConstant: 2),
      
      movieReservationCollection.topAnchor.constraint(equalTo: indicatorBar.bottomAnchor, constant: margin),
      movieReservationCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      movieReservationCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      movieReservationCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin * 2),
      ])
    
    indicatorBarWidthConstraint = indicatorBar.widthAnchor.constraint(equalToConstant: 58)
    indicatorBarWidthConstraint.isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MovieReservationView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieReservationCell.identifier, for: indexPath) as! MovieReservationCell
    
    return cell
  }
}

extension MovieReservationView: UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.frame.width, height: self.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
