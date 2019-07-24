//
//  MovieListCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
  static let identifier = "MovieListCell"
  
  let gradeImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.appColor(.darkBgColor)
    label.textAlignment = .left
    label.font = UIFont.boldSystemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let movieSubTitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.appColor(.defaultGrayColor)
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 11, weight: .thin)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let movieDurationLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.appColor(.defaultGrayColor)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let selectCheckImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.isHidden = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupTableViewCell()
  }
  
  func setting(movie: MovieList) {
    movie.isSelect ? isTrue() : isFalse()
    
    gradeImageView.image = UIImage(named: movie.ageImage)
    movieTitleLabel.text = movie.title
    movieSubTitleLabel.text = movie.type
    movieDurationLabel.text = movie.duration
    selectCheckImageView.image = UIImage(named: movie.checkImage)
  }
  
  func isTrue() {
    contentView.backgroundColor = UIColor.appColor(.selectedCellMintColor)
    movieTitleLabel.textColor = .white
    movieSubTitleLabel.textColor = .white
    movieDurationLabel.alpha = 0
    selectCheckImageView.isHidden = false
  }
  
  func isFalse() {
    contentView.backgroundColor = .white
    movieTitleLabel.textColor = UIColor.appColor(.darkBgColor)
    movieSubTitleLabel.textColor = UIColor.appColor(.defaultGrayColor)
    movieDurationLabel.alpha = 1
    selectCheckImageView.isHidden = true
  }
  
  
  private func setupTableViewCell() {
    
    contentView.addSubview(gradeImageView)
    gradeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
    gradeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    gradeImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
    gradeImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true

    contentView.addSubview(movieTitleLabel)
    movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    movieTitleLabel.leadingAnchor.constraint(equalTo: gradeImageView.trailingAnchor, constant: 15).isActive = true
    movieTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true

    contentView.addSubview(movieSubTitleLabel)
    movieSubTitleLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
    movieSubTitleLabel.leadingAnchor.constraint(equalTo: gradeImageView.trailingAnchor, constant: 15).isActive = true
    movieSubTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    movieSubTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
    movieSubTitleLabel.heightAnchor.constraint(equalTo: movieTitleLabel.heightAnchor).isActive = true

    contentView.addSubview(movieDurationLabel)
    movieDurationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    movieDurationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    movieDurationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

    contentView.addSubview(selectCheckImageView)
    selectCheckImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    selectCheckImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    selectCheckImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    selectCheckImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
