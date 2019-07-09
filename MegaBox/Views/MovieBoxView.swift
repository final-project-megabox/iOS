//
//  MovieBoxView.swift
//  MegaBox
//
//  Created by Fury on 09/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieBoxView: UIView {
  
  var movieBoxImageHeight: CGFloat = 0
  
  private let movieBoxImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "moviebox_temp_image")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let movieBoxLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "무비박스", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 20, alignment: nil)
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let movieBoxPageLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "1 / 8", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 15, alignment: nil)
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    movieBoxImageHeight = (self.frame.width * 460) / 708
    autoLayout()
  }
  
  private func setupProperties() {
    addSubViews()
  }
  
  private func addSubViews() {
    self.addSubview(movieBoxImage)
    self.addSubview(movieBoxLabel)
    self.addSubview(movieBoxPageLabel)
    self.addSubview(movieBoxVisualBottomView)
    movieBoxVisualBottomView.addSubview(movieBoxTitleLabel)
    movieBoxVisualBottomView.addSubview(movieBoxSubTitleLabel)
  }
  
  private func autoLayout() {
    let margin: CGFloat = 10
    NSLayoutConstraint.activate([
      movieBoxImage.topAnchor.constraint(equalTo: self.topAnchor),
      movieBoxImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      movieBoxImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      movieBoxImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      movieBoxImage.heightAnchor.constraint(equalToConstant: movieBoxImageHeight),
      
      movieBoxLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2),
      movieBoxLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin * 2),
      
      movieBoxPageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2),
      movieBoxPageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin * 2),
      
      movieBoxVisualBottomView.leadingAnchor.constraint(equalTo: movieBoxImage.leadingAnchor),
      movieBoxVisualBottomView.trailingAnchor.constraint(equalTo: movieBoxImage.trailingAnchor),
      movieBoxVisualBottomView.bottomAnchor.constraint(equalTo: movieBoxImage.bottomAnchor),
      movieBoxVisualBottomView.heightAnchor.constraint(equalToConstant: 85),
      
      movieBoxTitleLabel.leadingAnchor.constraint(equalTo: movieBoxVisualBottomView.leadingAnchor, constant: margin * 2),
      movieBoxTitleLabel.bottomAnchor.constraint(equalTo: movieBoxSubTitleLabel.topAnchor, constant: -margin),
      
      movieBoxSubTitleLabel.leadingAnchor.constraint(equalTo: movieBoxVisualBottomView.leadingAnchor, constant: margin * 2),
      movieBoxSubTitleLabel.bottomAnchor.constraint(equalTo: movieBoxVisualBottomView.bottomAnchor, constant: -margin * 2),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
