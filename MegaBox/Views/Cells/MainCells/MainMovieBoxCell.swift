//
//  MainMovieBoxCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainMovieBoxCell: UITableViewCell {
  static let identifier = "MainMovieBoxCell"
  var movieBoxImageHeight: CGFloat = 0
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let movieBoxImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "moviebox_temp_image")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let movieBoxLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "무비박스", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 17, alignment: nil)
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieBoxPageLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "1/8", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 13, alignment: nil)
    label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieBoxTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "스파이더맨: 파 프롬 홈", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 14, alignment: nil)
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieBoxSubTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "2019 마블의 피날레\n모든 것이 다시 시작된다!", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 12, alignment: nil)
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieBoxVisualBottomView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "main_moviebox_gradation")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let movieBoxRightButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_moviebox_right_btn"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let movieBoxLeftButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_moviebox_left_btn"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let movieBoxPlayButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_moviebox_play_btn"), for: .normal)
    button.alpha = 0.8
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(guideBGView)
    guideBGView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    guideBGView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    guideBGView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    guideBGView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    guideBGView.addSubview(movieBoxImage)
    movieBoxImage.topAnchor.constraint(equalTo: guideBGView.topAnchor).isActive = true
    movieBoxImage.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor).isActive = true
    movieBoxImage.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor).isActive = true
    movieBoxImage.bottomAnchor.constraint(equalTo: guideBGView.bottomAnchor).isActive = true
    movieBoxImage.heightAnchor.constraint(equalToConstant: (guideBGView.frame.width * 460) / 708).isActive = true
    
    guideBGView.addSubview(movieBoxLabel)
    movieBoxLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
    movieBoxLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 3).isActive = true
    
    guideBGView.addSubview(movieBoxPageLabel)
    movieBoxPageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
    movieBoxPageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 3).isActive = true
    
    guideBGView.addSubview(movieBoxVisualBottomView)
    movieBoxVisualBottomView.leadingAnchor.constraint(equalTo: movieBoxImage.leadingAnchor).isActive = true
    movieBoxVisualBottomView.trailingAnchor.constraint(equalTo: movieBoxImage.trailingAnchor).isActive = true
    movieBoxVisualBottomView.bottomAnchor.constraint(equalTo: movieBoxImage.bottomAnchor).isActive = true
    movieBoxVisualBottomView.heightAnchor.constraint(equalToConstant: 85).isActive = true
    
    movieBoxVisualBottomView.addSubview(movieBoxSubTitleLabel)
    movieBoxSubTitleLabel.leadingAnchor.constraint(equalTo: movieBoxVisualBottomView.leadingAnchor, constant: margin * 2).isActive = true
    movieBoxSubTitleLabel.bottomAnchor.constraint(equalTo: movieBoxVisualBottomView.bottomAnchor, constant: -margin * 2).isActive = true
    
    movieBoxVisualBottomView.addSubview(movieBoxTitleLabel)
    movieBoxTitleLabel.leadingAnchor.constraint(equalTo: movieBoxVisualBottomView.leadingAnchor, constant: margin * 2).isActive = true
    movieBoxTitleLabel.bottomAnchor.constraint(equalTo: movieBoxSubTitleLabel.topAnchor, constant: -margin).isActive = true
    
    guideBGView.addSubview(movieBoxLeftButton)
    movieBoxLeftButton.centerYAnchor.constraint(equalTo: guideBGView.centerYAnchor).isActive = true
    movieBoxLeftButton.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin).isActive = true
    
    guideBGView.addSubview(movieBoxRightButton)
    movieBoxRightButton.centerYAnchor.constraint(equalTo: guideBGView.centerYAnchor).isActive = true
    movieBoxRightButton.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin).isActive = true
    
    guideBGView.addSubview(movieBoxPlayButton)
    movieBoxPlayButton.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin).isActive = true
    movieBoxPlayButton.bottomAnchor.constraint(equalTo: guideBGView.bottomAnchor, constant: -margin).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
