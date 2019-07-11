//
//  MovieReservationCell.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieReservationCell: UICollectionViewCell {
  static let identifier = "MovieReservationCell"
  
  private var movieReservationStackView = UIStackView()
  
  let thumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "spiderman_thumbnail")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let thumbnailNumLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "1", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 5, alignment: .center)
    label.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.1607843137, blue: 0.3764705882, alpha: 1)
    return label
  }()
  
  private let titleNameLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "스파이더맨: 파 프롬 홈", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 15, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    return label
  }()
  
  let subLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "예매율 47.6 %", color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), fontSize: 13, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    return label
  }()
  
  let directReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("바로예매", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)
    button.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    button.layer.borderWidth = 0.5
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupStackView()
    setupProperties()
  }
  
  private func setupStackView() {
    
    movieReservationStackView = UIStackView(arrangedSubviews: [titleNameLabel, subLabel, directReservationButton])
    movieReservationStackView.axis = .vertical
    movieReservationStackView.alignment = .center
    movieReservationStackView.distribution = .fillEqually
    movieReservationStackView.spacing = 5
    movieReservationStackView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupProperties() {
    // thumbnail Image 비율로 hieght 구하기
    let margin: CGFloat = 10
    let thumbnailImageHeight = ((UIScreen.main.bounds.width / 2.7) * 916) / 640
    
    contentView.addSubview(thumbnailImage)
    thumbnailImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    thumbnailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    thumbnailImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    thumbnailImage.heightAnchor.constraint(equalToConstant: thumbnailImageHeight).isActive = true
    
        contentView.addSubview(movieReservationStackView)
        movieReservationStackView.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: margin).isActive = true
        movieReservationStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieReservationStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        movieReservationStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
