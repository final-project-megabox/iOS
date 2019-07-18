//
//  MovieCategorySelectTheaterView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieCategorySelectTheatherView: UIView {
  private let topView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화별 예매"
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let titleLabelBottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "common_btn_topbar_prev2"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let selectMovieImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화"
    label.font = UIFont.systemFont(ofSize: 11)
    label.textAlignment = .center
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.backgroundColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.alpha = 0.7
    label.layer.cornerRadius = 5
    label.clipsToBounds = true
    label.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.layer.shadowOffset = CGSize(width: 3, height: 3)
    label.layer.shadowOpacity = 0.7
    label.layer.shadowRadius = 4.0
    label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let firstLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.8800999603, green: 0.8800999603, blue: 0.8800999603, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let selectTheaterView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let secondLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.8800999603, green: 0.8800999603, blue: 0.8800999603, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let selectDateView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupMyPageTopView()
  }
  
  
  private func setupMyPageTopView() {
    addSubview(topView)
    topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    topView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
    titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
    addSubview(titleLabelBottomLine)
    titleLabelBottomLine.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    titleLabelBottomLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    titleLabelBottomLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    titleLabelBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    topView.addSubview(dismissButton)
    dismissButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
    dismissButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10).isActive = true
    dismissButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    dismissButton.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.1).isActive = true
    
    addSubview(selectMovieImageView)
    selectMovieImageView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    selectMovieImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    selectMovieImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
    selectMovieImageView.heightAnchor.constraint(equalTo: selectMovieImageView.widthAnchor).isActive = true
    
    selectMovieImageView.addSubview(movieTitleLabel)
    movieTitleLabel.topAnchor.constraint(equalTo: selectMovieImageView.topAnchor).isActive = true
    movieTitleLabel.leadingAnchor.constraint(equalTo: selectMovieImageView.leadingAnchor, constant: 10).isActive = true
    movieTitleLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
    movieTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
    selectMovieImageView.addSubview(firstLine)
    firstLine.topAnchor.constraint(equalTo: selectMovieImageView.topAnchor).isActive = true
    firstLine.trailingAnchor.constraint(equalTo: selectMovieImageView.trailingAnchor).isActive = true
    firstLine.bottomAnchor.constraint(equalTo: selectMovieImageView.bottomAnchor).isActive = true
    firstLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
    
    addSubview(selectTheaterView)
    selectTheaterView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    selectTheaterView.leadingAnchor.constraint(equalTo: selectMovieImageView.trailingAnchor).isActive = true
    selectTheaterView.widthAnchor.constraint(equalTo: selectMovieImageView.widthAnchor).isActive = true
    selectTheaterView.heightAnchor.constraint(equalTo: selectMovieImageView.heightAnchor).isActive = true
    
    selectTheaterView.addSubview(secondLine)
    secondLine.topAnchor.constraint(equalTo: selectTheaterView.topAnchor).isActive = true
    secondLine.trailingAnchor.constraint(equalTo: selectTheaterView.trailingAnchor).isActive = true
    secondLine.bottomAnchor.constraint(equalTo: selectTheaterView.bottomAnchor).isActive = true
    secondLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
    
    
    addSubview(selectDateView)
    selectDateView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    selectDateView.leadingAnchor.constraint(equalTo: selectTheaterView.trailingAnchor).isActive = true
    selectDateView.widthAnchor.constraint(equalTo: selectMovieImageView.widthAnchor).isActive = true
    selectDateView.heightAnchor.constraint(equalTo: selectMovieImageView.heightAnchor).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
