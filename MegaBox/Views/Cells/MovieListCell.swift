//
//  MovieListCell.swift
//  MegaBox
//
//  Created by 차수연 on 08/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
  static let identifier = "MovieListCell"
  
  let gradeImageView: UIImageView = {
    let imageView = UIImageView()
//    imageView.image = #imageLiteral(resourceName: <#T##String#>)
    imageView.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "title", color: .black, fontSize: 13, alignment: .left)
    label.font = UIFont.boldSystemFont(ofSize: 13)
    label.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let movieSubTitleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "subTitle", color: #colorLiteral(red: 0.9441822652, green: 0.9441822652, blue: 0.9441822652, alpha: 1), fontSize: 12, alignment: .left)
    label.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let movieDurationLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "000분", color: #colorLiteral(red: 0.9441822652, green: 0.9441822652, blue: 0.9441822652, alpha: 1), fontSize: 12, alignment: .center)
    label.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupTableViewCell()
  }
  
  private func setupTableViewCell() {
    contentView.addSubview(gradeImageView)
    contentView.addSubview(movieTitleLabel)
//    contentView.addSubview(movieSubTitleLabel)
//    contentView.addSubview(movieDurationLabel)
    
    gradeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    gradeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
    gradeImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
    gradeImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
    
    movieTitleLabel.leadingAnchor.constraint(equalTo: gradeImageView.trailingAnchor, constant: 10).isActive = true
    movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    movieTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
    movieTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4).isActive = true
    
    
    
    
  }
  
  
  
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
