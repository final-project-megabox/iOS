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
  
  var delegate: TheaterCategorySectionCellDelegate?
  
  private let movieGradeImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let movieTitle: UILabel = {
    let label = UILabel()
    label.text = "라이온 킹"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let rightButton: UIButton = {
    let button = UIButton()
    button.setTitle(">", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
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
    self.layer.borderWidth = 1
    self.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    self.delegate?.touchUpMovieTitle()
  }
  
  func cellConfigure(_ gradeImage: UIImage, _ movieTitle: String) {
    self.movieGradeImage.image = gradeImage
    self.movieTitle.text = movieTitle
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(movieGradeImage)
    movieGradeImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    movieGradeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    movieGradeImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
    movieGradeImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    contentView.addSubview(movieTitle)
    movieTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    movieTitle.leadingAnchor.constraint(equalTo: movieGradeImage.trailingAnchor, constant: margin / 2).isActive = true
    
    contentView.addSubview(rightButton)
    rightButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    rightButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
