//
//  TheaterCategorySectionCell.swift
//  MegaBox
//
//  Created by Fury on 23/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySectionCell: UITableViewCell {
  static let identifier = "TheaterCategorySectionCell"
  
  let movieGradeImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let movieTitle: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let rightButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(">", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.backgroundColor = UIColor.appColor(.selectedCellGrayColor)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    contentView.addSubview(movieGradeImage)
    movieGradeImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    movieGradeImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    movieGradeImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    contentView.addSubview(movieTitle)
    movieTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    movieTitle.leadingAnchor.constraint(equalTo: movieGradeImage.trailingAnchor).isActive = true
    
    contentView.addSubview(rightButton)
    rightButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    rightButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }}
