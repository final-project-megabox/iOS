//
//  MainMoviePostCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainMoviePostCell: UITableViewCell {
  static let identifier = "MainMoviePostCell"
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "무비포스트", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 16, alignment: .left)
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let plusButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_more_btn"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let moviePostCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(MainMoviePostCollectionCell.self, forCellWithReuseIdentifier: MainMoviePostCollectionCell.identifier)
    collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
    moviePostCollectionView.dataSource = self
    moviePostCollectionView.delegate = self
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(guideBGView)
    guideBGView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin).isActive = true
    guideBGView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    guideBGView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    guideBGView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    guideBGView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideBGView.addSubview(plusButton)
    plusButton.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    plusButton.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin * 2).isActive = true
    plusButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
    plusButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    guideBGView.addSubview(moviePostCollectionView)
    moviePostCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin * 2).isActive = true
    moviePostCollectionView.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin).isActive = true
    moviePostCollectionView.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin).isActive = true
    moviePostCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MainMoviePostCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMoviePostCollectionCell.identifier, for: indexPath) as! MainMoviePostCollectionCell
    
    return cell
  }
  
  
}

extension MainMoviePostCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width - 50
    
    return CGSize(width: width / 2, height: width / 2)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
