//
//  MainMovieReservationCell.swift
//  MegaBox
//
//  Created by Fury on 10/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainMovieReservationCell: UITableViewCell {
  var indicatorBarLeadingConstraint: NSLayoutConstraint!
  var indicatorBarTrailingConstraint: NSLayoutConstraint!
  static let identifier = "MainMovieReservationCell"
  
  var delegate: MainMovieReservationCellDelegate?
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
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
  
  private let boxOfficeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("박스오피스", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 0
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    return button
  }()
  
  private let showingScheduleButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("상영예정", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 1
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let curationButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("큐레이션", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 2
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let stageGreetingButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("무대인사", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 3
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  let indicatorBar: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let movieReservationCollection: UICollectionView = {
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
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
    setupProperties()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    makeAutoLayout()
  }
  
  @objc func touchUpOwlStageButton(_ sender: UIButton) {
    print("[Log] OwlStaageButtonDidTapped")
    let stackViewWidth = guideBGView.frame.width
    delegate?.touchUpOwlStageButton(sender, indicatorBarTrailingConstraint, indicatorBarLeadingConstraint, stackViewWidth)
  }
  
  private func setupProperties() {
    boxOfficeButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    showingScheduleButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    curationButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    stageGreetingButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    
    movieReservationCollection.dataSource = self
    movieReservationCollection.delegate = self
    movieReservationCollection.register(MovieReservationCollectionViewCell.self, forCellWithReuseIdentifier: MovieReservationCollectionViewCell.identifier)
    setupStackView()
  }
  
  private func setupStackView() {
    movieReservationStack = UIStackView(arrangedSubviews: [boxOfficeButton, showingScheduleButton, curationButton, stageGreetingButton])
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
    indicatorBarLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2)
    indicatorBarLeadingConstraint.isActive = true
    indicatorBar.heightAnchor.constraint(equalToConstant: 3).isActive = true
    indicatorBarTrailingConstraint = indicatorBar.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -278)
    indicatorBarTrailingConstraint.isActive = true
    
    guideBGView.addSubview(movieReservationCollection)
    movieReservationCollection.topAnchor.constraint(equalTo: indicatorBar.bottomAnchor, constant: margin * 2).isActive = true
    movieReservationCollection.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: -margin).isActive = true
    movieReservationCollection.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: margin).isActive = true
    movieReservationCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin * 2).isActive = true
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieReservationCollectionViewCell.identifier, for: indexPath) as! MovieReservationCollectionViewCell
    if indexPath.row == 0 {
      cell.thumbnailImage.image = #imageLiteral(resourceName: "temp_reservation_image")
      cell.thumbnailImage.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
      cell.thumbnailImage.layer.borderWidth = 0.5
      cell.thumbnailNumLabel.isHidden = true
      cell.subLabel.numberOfLines = 0
      cell.directReservationButton.isHidden = true
    } else {
      cell.thumbnailImage.image = #imageLiteral(resourceName: "spiderman_thumbnail")
      cell.thumbnailNumLabel.labelSetup(text: String(indexPath.row), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 15, alignment: .center)
    }
    return cell
  }
}

extension MainMovieReservationCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = movieReservationCollection.frame.height
    if indexPath.row == 0 {
      return CGSize(width: UIScreen.main.bounds.width - 94, height: height)
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
