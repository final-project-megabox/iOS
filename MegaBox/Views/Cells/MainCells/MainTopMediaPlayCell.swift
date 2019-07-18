//
//  MainTopMediaPlayCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainTopMediaPlayCell: UITableViewCell {
  static let identifier = "MainTopMediaPlayCell"
  
  private let topMediaImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "image1")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let topMediaVisualBottomView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "main_moviebox_gradation")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let topMediaPlayButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_moviebox_play_btn"), for: .normal)
    button.alpha = 0.8
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let topMediaTitleText: UILabel = {
    let label = UILabel()
    label.text = "스파이더맨: 파 프롬 홈"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let topMediaSubTitleText: UILabel = {
    let label = UILabel()
    label.text = "모든 것이 다시 시작된다!"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let viewDetailButton: UIButton = {
    let button = UIButton()
    button.setTitle("상세보기", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    
    contentView.addSubview(topMediaImageView)
    topMediaImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    topMediaImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    topMediaImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    topMediaImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    topMediaImageView.addSubview(topMediaPlayButton)
    topMediaPlayButton.centerXAnchor.constraint(equalTo: topMediaImageView.centerXAnchor).isActive = true
    topMediaPlayButton.centerYAnchor.constraint(equalTo: topMediaImageView.centerYAnchor).isActive = true
    
    topMediaImageView.addSubview(topMediaVisualBottomView)
    topMediaVisualBottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    topMediaVisualBottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    topMediaVisualBottomView.bottomAnchor.constraint(equalTo: topMediaImageView.bottomAnchor).isActive = true
    topMediaVisualBottomView.heightAnchor.constraint(equalToConstant: 85).isActive = true
    
    topMediaImageView.addSubview(topMediaSubTitleText)
    topMediaSubTitleText.leadingAnchor.constraint(equalTo: topMediaImageView.leadingAnchor, constant: margin * 3).isActive = true
    topMediaSubTitleText.bottomAnchor.constraint(equalTo: topMediaImageView.bottomAnchor, constant: -margin * 2).isActive = true
    
    topMediaImageView.addSubview(topMediaTitleText)
    topMediaTitleText.leadingAnchor.constraint(equalTo: topMediaImageView.leadingAnchor, constant: margin * 3).isActive = true
    topMediaTitleText.bottomAnchor.constraint(equalTo: topMediaSubTitleText.topAnchor).isActive = true
    
    topMediaImageView.addSubview(viewDetailButton)
    viewDetailButton.trailingAnchor.constraint(equalTo: topMediaImageView.trailingAnchor, constant: -margin * 2).isActive = true
    viewDetailButton.bottomAnchor.constraint(equalTo: topMediaImageView.bottomAnchor, constant: -25).isActive = true
    viewDetailButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
