//
//  MainMovieReservationCell.swift
//  MegaBox
//
//  Created by Fury on 10/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainMovieReservationCell: UITableViewCell {
  private var indicatorBarWidthConstraint: NSLayoutConstraint!
  static let identifier = "MainMovieReservationCell"
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
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
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupProperties()
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    makeAutoLayout()
  }
  
  private func setupProperties() {
    movieReservationCollection.dataSource = self
    movieReservationCollection.delegate = self
    movieReservationCollection.register(MovieReservationCell.self, forCellWithReuseIdentifier: MovieReservationCell.identifier)
    setupStackView()
  }
  
  private func setupStackView() {
    movieReservationStack = UIStackView(arrangedSubviews: [boxOfficeLabel, showingScheduleLabel, curationLabel, stageGreetingLabel])
    movieReservationStack.translatesAutoresizingMaskIntoConstraints = false
    
    movieReservationStack.axis = .horizontal
    movieReservationStack.alignment = .leading
    movieReservationStack.distribution = .fill
    movieReservationStack.spacing = 20
  }
  
  private func makeAutoLayout() {
    let margin: CGFloat = 10
    contentView.addSubview(guideBGView)
    guideBGView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin).isActive = true
    guideBGView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    guideBGView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    guideBGView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
    
    guideBGView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideBGView.addSubview(plusButton)
    plusButton.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    plusButton.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin * 2).isActive = true
    plusButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
    plusButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    guideBGView.addSubview(divisionLine)
    divisionLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin).isActive = true
    divisionLine.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    divisionLine.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin * 2).isActive = true
    divisionLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    
    guideBGView.addSubview(movieReservationStack)
    movieReservationStack.topAnchor.constraint(equalTo: divisionLine.bottomAnchor).isActive = true
    movieReservationStack.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideBGView.addSubview(indicatorBar)
    indicatorBar.topAnchor.constraint(equalTo: movieReservationStack.bottomAnchor, constant: -3).isActive = true
    indicatorBar.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    indicatorBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
    indicatorBarWidthConstraint = indicatorBar.widthAnchor.constraint(equalToConstant: 58)
    indicatorBarWidthConstraint.isActive = true
    
    guideBGView.addSubview(movieReservationCollection)
    movieReservationCollection.topAnchor.constraint(equalTo: indicatorBar.bottomAnchor, constant: margin * 2).isActive = true
    movieReservationCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    movieReservationCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    movieReservationCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin * 3).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MainMovieReservationCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieReservationCell.identifier, for: indexPath) as! MovieReservationCell
    cell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    cell.layer.borderWidth = 0.5
    if indexPath.row == 0 {
      cell.thumbnailImage.image = #imageLiteral(resourceName: "temp_reservation_image")
      cell.subLabel.numberOfLines = 0
      cell.directReservationButton.isHidden = true
    }
    return cell
  }
}

extension MainMovieReservationCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = movieReservationCollection.frame.height
    if indexPath.row == 0 {
      return CGSize(width: UIScreen.main.bounds.width - 80, height: height)
    } else {
      return CGSize(width: UIScreen.main.bounds.width / 2.7, height: height)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
