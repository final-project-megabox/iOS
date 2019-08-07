//
//  MyPageWishMovieCell.swift
//  MegaBox
//
//  Created by 차수연 on 07/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageWishMovieCell: UITableViewCell {
  static let identifier = "MyPageWishMovieCell"
  
  let gradeImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_noage")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let thumnailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "spiderman_thumbnail")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "엑시트"
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let typeLabel: UILabel = {
    let label = UILabel()
    label.text = "기타/103분/코미디,액션"
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.text = "2019.07.31"
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let directorLabel: UILabel = {
    let label = UILabel()
    label.text = "감독 이상근"
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let actorLabel: UILabel = {
    let label = UILabel()
    label.text = "출연 조정석,윤아"
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
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
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    setupWishMovieCell()
  }
  
  func setupWishMovieCell() {
    addSubview(gradeImageView)
    gradeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    gradeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    gradeImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
    gradeImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
    
    addSubview(movieTitleLabel)
    movieTitleLabel.topAnchor.constraint(equalTo: gradeImageView.topAnchor).isActive = true
    movieTitleLabel.leadingAnchor.constraint(equalTo: gradeImageView.trailingAnchor, constant: 3).isActive = true
    
    addSubview(thumnailImageView)
    thumnailImageView.topAnchor.constraint(equalTo: gradeImageView.bottomAnchor, constant: 2).isActive = true
    thumnailImageView.leadingAnchor.constraint(equalTo: gradeImageView.leadingAnchor, constant: 5).isActive = true
    thumnailImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    thumnailImageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
    thumnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
    
    addSubview(typeLabel)
    typeLabel.topAnchor.constraint(equalTo: thumnailImageView.topAnchor, constant: 2).isActive = true
    typeLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 10).isActive = true
    
    addSubview(dateLabel)
    dateLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 2).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor).isActive = true
    
    addSubview(directorLabel)
    directorLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2).isActive = true
    directorLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor).isActive = true
    
    addSubview(actorLabel)
    actorLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 2).isActive = true
    actorLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor).isActive = true
    
    addSubview(deleteButton)
    deleteButton.topAnchor.constraint(equalTo: directorLabel.topAnchor).isActive = true
    deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    deleteButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
    deleteButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
