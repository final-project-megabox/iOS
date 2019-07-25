//
//  MainEventCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainEventCell: UITableViewCell {
  var indicatorBarLeadingConstraint: NSLayoutConstraint!
  var indicatorBarTrailingConstraint: NSLayoutConstraint!
  static let identifier = "MainEventCell"
  
  var delegate: MainEventCellDelegate?
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "이벤트", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 16, alignment: .left)
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
  
  private var eventStack: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  private let allButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("전체", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 0
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    return button
  }()
  
  private let megaBoxButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("메가박스", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 1
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let movieButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("영화", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 2
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let coalitionButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("제휴", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 3
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let theaterButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("영화관", for: .normal)
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
  
  let eventCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.register(EventCollectionCell.self, forCellWithReuseIdentifier: EventCollectionCell.identifier)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
    setupProperties()
    makeAutoLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    indicatorBarTrailingConstraint.constant = -(guideBGView.frame.width - allButton.frame.maxX - 20)
  }

  @objc func touchUpOwlStageButton(_ sender: UIButton) {
    let stackViewWidth = guideBGView.frame.width
    delegate?.touchUpEventOwlStageButton(sender, indicatorBarTrailingConstraint, indicatorBarLeadingConstraint, stackViewWidth)
  }
  
  private func setupProperties() {
    allButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    megaBoxButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    movieButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    coalitionButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    theaterButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    
    eventCollection.dataSource = self
    eventCollection.delegate = self
    
    setupStackView()
  }
  
  private func setupStackView() {
    eventStack = UIStackView(arrangedSubviews: [allButton, megaBoxButton, movieButton, coalitionButton, theaterButton])
    eventStack.translatesAutoresizingMaskIntoConstraints = false
    eventStack.axis = .horizontal
    eventStack.alignment = .leading
    eventStack.distribution = .fill
    eventStack.spacing = 20
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
    
    guideBGView.addSubview(eventStack)
    eventStack.topAnchor.constraint(equalTo: divisionLine.bottomAnchor).isActive = true
    eventStack.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideBGView.addSubview(indicatorBar)
    indicatorBar.topAnchor.constraint(equalTo: eventStack.bottomAnchor, constant: -3).isActive = true
    indicatorBarLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2)
    indicatorBarLeadingConstraint.isActive = true
    indicatorBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
    indicatorBarTrailingConstraint = indicatorBar.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor)
    indicatorBarTrailingConstraint.isActive = true
    
    guideBGView.addSubview(eventCollection)
    eventCollection.topAnchor.constraint(equalTo: indicatorBar.bottomAnchor, constant: margin).isActive = true
    eventCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    eventCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    eventCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin * 2).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MainEventCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionCell.identifier, for: indexPath) as! EventCollectionCell
    cell.thumbnailImage.image = #imageLiteral(resourceName: "ad_event1")
    return cell
  }
}

extension MainEventCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = eventCollection.frame.height
    return CGSize(width: UIScreen.main.bounds.width - 60, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
