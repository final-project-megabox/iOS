//
//  BranchNewsCollectionCell.swift
//  MegaBox
//
//  Created by Fury on 23/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class BranchNewsCollectionCell: UICollectionViewCell {
  static let identifier = "MovieReservationCell"
  
  private let branchNewsImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "branchImg3")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let thumbnailTextLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "지점이벤트", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 12, alignment: .center)
    label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
    self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(branchNewsImage)
    branchNewsImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    branchNewsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    branchNewsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    branchNewsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    contentView.addSubview(thumbnailTextLabel)
    thumbnailTextLabel.topAnchor.constraint(equalTo: branchNewsImage.topAnchor).isActive = true
    thumbnailTextLabel.trailingAnchor.constraint(equalTo: branchNewsImage.trailingAnchor).isActive = true
    
    contentView.addSubview(branchNewsBottomView)
    branchNewsBottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    branchNewsBottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    branchNewsBottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    branchNewsBottomView.addSubview(branchNewsTitleLabel)
    branchNewsTitleLabel.topAnchor.constraint(equalTo: branchNewsBottomView.topAnchor, constant: margin).isActive = true
    branchNewsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    
    branchNewsBottomView.addSubview(branchNewsSubLabel)
    branchNewsSubLabel.topAnchor.constraint(equalTo: branchNewsTitleLabel.bottomAnchor, constant: margin / 2).isActive = true
    branchNewsSubLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    branchNewsSubLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    branchNewsSubLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
    branchNewsSubLabel.widthAnchor.constraint(equalTo: branchNewsTitleLabel.widthAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
