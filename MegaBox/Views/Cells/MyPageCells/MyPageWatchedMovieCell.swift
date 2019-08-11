//
//  MyPageWatchedMovieCell.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageWatchedMovieCell: UITableViewCell {
  static let identifier = "MyPageWatchedMovieCell"
  
  let movieImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "spiderman_thumbnail")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let gradeImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_15")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "어벤져스: 인피니트 워"
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.text = "2018-08-22 19:33~20:55"
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let theaterLabel: UILabel = {
    let label = UILabel()
    label.text = "고양스타필드 4관 /1명"
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let gradeLabel: UILabel = {
    let label = UILabel()
    label.text = "등록된 평점이 없습니다."
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let deleteButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_close_nor"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let commentButton: UIButton = {
    let button = UIButton()
    button.setTitle("한줄평 쓰기", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(#colorLiteral(red: 0.2865450496, green: 0.2865450496, blue: 0.2865450496, alpha: 1), for: .normal)
    button.layer.borderColor = #colorLiteral(red: 0.2865450496, green: 0.2865450496, blue: 0.2865450496, alpha: 1)
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let postButton: UIButton = {
    let button = UIButton()
    button.setTitle("포스트 쓰기", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(#colorLiteral(red: 0.2865450496, green: 0.2865450496, blue: 0.2865450496, alpha: 1), for: .normal)
    button.layer.borderColor = #colorLiteral(red: 0.2865450496, green: 0.2865450496, blue: 0.2865450496, alpha: 1)
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupWatchedCell()
  }
  
  
  func setupWatchedCell() {
    addSubview(movieImageView) //60 85
    movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    movieImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    movieImageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
    
    addSubview(gradeImageView) // 18
    gradeImageView.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 5).isActive = true
    gradeImageView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
    gradeImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
    gradeImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
    
    addSubview(titleLabel)
    titleLabel.leadingAnchor.constraint(equalTo: gradeImageView.trailingAnchor, constant: 5).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: gradeImageView.centerYAnchor).isActive = true
    
    addSubview(dateLabel)
    dateLabel.topAnchor.constraint(equalTo: gradeImageView.bottomAnchor, constant: 10).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: gradeImageView.leadingAnchor).isActive = true
    
    addSubview(theaterLabel)
    theaterLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
    theaterLabel.leadingAnchor.constraint(equalTo: gradeImageView.leadingAnchor).isActive = true
    
    addSubview(gradeLabel)
    gradeLabel.topAnchor.constraint(equalTo: theaterLabel.bottomAnchor, constant: 5).isActive = true
    gradeLabel.leadingAnchor.constraint(equalTo: gradeImageView.leadingAnchor).isActive = true
    
    addSubview(deleteButton)
    deleteButton.topAnchor.constraint(equalTo: movieImageView.topAnchor).isActive = true
    deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    deleteButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
    deleteButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    addSubview(postButton)
    postButton.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 5).isActive = true
    postButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    postButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    postButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    postButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    addSubview(commentButton)
    commentButton.topAnchor.constraint(equalTo: postButton.topAnchor).isActive = true
    commentButton.trailingAnchor.constraint(equalTo: postButton.leadingAnchor, constant: -5).isActive = true
    commentButton.bottomAnchor.constraint(equalTo: postButton.bottomAnchor).isActive = true
    commentButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    commentButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
