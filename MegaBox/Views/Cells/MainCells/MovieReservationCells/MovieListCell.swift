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
    label.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    label.textAlignment = .left
    label.font = UIFont.boldSystemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let movieSubTitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 11, weight: .thin)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let movieDurationLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
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
    contentView.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7450980392, blue: 0.7843137255, alpha: 1)
    movieTitleLabel.textColor = .white
    movieSubTitleLabel.textColor = .white
    movieDurationLabel.alpha = 0
    selectCheckImageView.isHidden = false
  }
  
  func isFalse() {
    contentView.backgroundColor = .white
    movieTitleLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    movieSubTitleLabel.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    movieDurationLabel.alpha = 1
    selectCheckImageView.isHidden = true
  }
  
  
  private func setupTableViewCell() {
    contentView.addSubview(gradeImageView)
    contentView.addSubview(movieTitleLabel)
    contentView.addSubview(movieSubTitleLabel)
    contentView.addSubview(movieDurationLabel)
    contentView.addSubview(selectCheckImageView)
    
    gradeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
    gradeImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
    gradeImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    gradeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    
    movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    movieTitleLabel.leadingAnchor.constraint(equalTo: gradeImageView.trailingAnchor, constant: 10).isActive = true
    movieTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
    movieTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4).isActive = true
    
    movieSubTitleLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
    movieSubTitleLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor).isActive = true
    movieSubTitleLabel.widthAnchor.constraint(equalTo: movieTitleLabel.widthAnchor).isActive = true
    movieSubTitleLabel.heightAnchor.constraint(equalTo: movieTitleLabel.heightAnchor).isActive = true
    movieSubTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    
    movieDurationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    movieDurationLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
    movieDurationLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
    movieDurationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    
    selectCheckImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    selectCheckImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    selectCheckImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    selectCheckImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
