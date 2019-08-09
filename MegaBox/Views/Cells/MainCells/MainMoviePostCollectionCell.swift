//
//  MoviePostCollectionCell.swift
//  MegaBox
//
//  Created by Fury on 07/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainMoviePostCollectionCell: UICollectionViewCell {
  static let identifier = "MoviePostCollectionCell"
  
  let moviePostImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "moviepost3")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let idLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "furysecu**", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 11, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
    label.backgroundColor = .clear
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "6분전", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 11, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
    label.backgroundColor = .clear
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let contentLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "아니 너무 재밌는거 아니에요? 진심 꿀잼!!!! 꼭 보시길....", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 14, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.backgroundColor = .clear
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let hashtagLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "사자", color: #colorLiteral(red: 0.028782757, green: 0.6807617545, blue: 0.899825871, alpha: 1), fontSize: 12, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    label.backgroundColor = .clear
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private var branchNewsBottomView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.alpha = 0.6
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let branchNewsTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "대구", color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), fontSize: 14, alignment: .left)
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let branchNewsSubLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "#Me플리 #플리마켓놀이", color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), fontSize: 13, alignment: .left)
    label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(moviePostImage)
    moviePostImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    moviePostImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    moviePostImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    moviePostImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    moviePostImage.addSubview(idLabel)
    idLabel.topAnchor.constraint(equalTo: moviePostImage.topAnchor, constant: margin / 2).isActive = true
    idLabel.leadingAnchor.constraint(equalTo: moviePostImage.leadingAnchor, constant: margin).isActive = true
    
    moviePostImage.addSubview(timeLabel)
    timeLabel.topAnchor.constraint(equalTo: moviePostImage.topAnchor, constant: margin / 2).isActive = true
    timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin / 2).isActive = true
    
    moviePostImage.addSubview(contentLabel)
    contentLabel.centerYAnchor.constraint(equalTo: moviePostImage.centerYAnchor).isActive = true
    contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    
    moviePostImage.addSubview(hashtagLabel)
    hashtagLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: margin).isActive = true
    hashtagLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

