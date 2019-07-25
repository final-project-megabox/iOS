//
//  MovieReservationCollectionViewCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieReservationCollectionCell: UICollectionViewCell {
  static let identifier = "MovieReservationCell"
  
  private var movieReservationView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    view.layer.borderWidth = 0.5
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let thumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let thumbnailNumLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "1", color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fontSize: 15, alignment: .center)
    label.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.1607843137, blue: 0.3764705882, alpha: 1)
    label.alpha = 0.95
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let titleNameLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "스파이더맨: 파 프롬 홈", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 14, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let subLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "예매율 47.6 %", color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), fontSize: 12, alignment: .center)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let directReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("바로예매", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)
    button.layer.borderColor = #colorLiteral(red: 0.6016481519, green: 0.5980746746, blue: 0.6043972373, alpha: 1)
    button.layer.borderWidth = 0.5
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupProperties()
  }
  
  func cellConfigure(_ thumbImage: Data, _ movieData: MovieData, _ movieNum: Int) {
    self.thumbnailImage.image = UIImage(data: thumbImage)
    self.titleNameLabel.text = movieData.title
    self.thumbnailNumLabel.text = "\(movieNum + 1)"
    self.subLabel.text = "예매율 \(movieData.bookingRate) %"
  }
  
  private func setupProperties() {
    // thumbnail Image 비율로 hieght 구하기
    let margin: CGFloat = 10
    let thumbnailImageHeight = ((UIScreen.main.bounds.width / 2.7) * 916) / 640
    
    contentView.addSubview(thumbnailImage)
    thumbnailImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    thumbnailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    thumbnailImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    thumbnailImage.heightAnchor.constraint(equalToConstant: thumbnailImageHeight).isActive = true
    
    thumbnailImage.addSubview(thumbnailNumLabel)
    thumbnailNumLabel.topAnchor.constraint(equalTo: thumbnailImage.topAnchor, constant: -5).isActive = true
    thumbnailNumLabel.leadingAnchor.constraint(equalTo: thumbnailImage.leadingAnchor, constant: margin).isActive = true
    thumbnailNumLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    thumbnailNumLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
    
    contentView.addSubview(movieReservationView)
    movieReservationView.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor).isActive = true
    movieReservationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    movieReservationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    movieReservationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
    
    movieReservationView.addSubview(titleNameLabel)
    titleNameLabel.topAnchor.constraint(equalTo: movieReservationView.topAnchor, constant: margin).isActive = true
    titleNameLabel.leadingAnchor.constraint(equalTo: movieReservationView.leadingAnchor).isActive = true
    titleNameLabel.trailingAnchor.constraint(equalTo: movieReservationView.trailingAnchor).isActive = true
    
    movieReservationView.addSubview(subLabel)
    subLabel.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor, constant: margin / 2).isActive = true
    subLabel.leadingAnchor.constraint(equalTo: movieReservationView.leadingAnchor).isActive = true
    subLabel.trailingAnchor.constraint(equalTo: movieReservationView.trailingAnchor).isActive = true
    subLabel.heightAnchor.constraint(equalTo: titleNameLabel.heightAnchor).isActive = true
    
    movieReservationView.addSubview(directReservationButton)
    directReservationButton.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: margin / 2).isActive = true
    directReservationButton.centerXAnchor.constraint(equalTo: movieReservationView.centerXAnchor).isActive = true
    directReservationButton.bottomAnchor.constraint(equalTo: movieReservationView.bottomAnchor, constant: -margin).isActive = true
    directReservationButton.heightAnchor.constraint(equalTo: subLabel.heightAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
