//
//  MovieCategorySelectTheaterView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieCategorySelectTheatherView: UIView {
  
  // MARK: - Properties
  var delegate: MovieCategorySelectTheatherViewDelegate?
  
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
    button.setImage(#imageLiteral(resourceName: "common_btn_topbar_prev2-1"), for: .normal)
    button.addTarget(self, action: #selector(didTapDismissButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let selectMovieImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "spiderman_thumbnail")
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화"
    label.font = UIFont.systemFont(ofSize: 11)
    label.textAlignment = .center
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.alpha = 0.9
    label.layer.cornerRadius = 5
    label.clipsToBounds = true
    label.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.layer.shadowOffset = CGSize(width: 3, height: 3)
    label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let selectMovieButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapSelectButton(_:)), for: .touchUpInside)
    button.tag = 0
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
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
  
  private let theaterTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관"
    label.font = UIFont.systemFont(ofSize: 11)
    label.textAlignment = .center
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.alpha = 0.9
    label.layer.cornerRadius = 5
    label.clipsToBounds = true
    label.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.layer.shadowOffset = CGSize(width: 3, height: 3)
    label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let plusImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "booking_menu_icon_add")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let selectTheaterLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관 선택"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let firstSelectTheaterButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapSelectButton(_:)), for: .touchUpInside)
    button.tag = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
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
  
  private let dateTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "날짜"
    label.font = UIFont.systemFont(ofSize: 11)
    label.textAlignment = .center
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.alpha = 0.9
    label.layer.cornerRadius = 5
    label.clipsToBounds = true
    label.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.layer.shadowOffset = CGSize(width: 3, height: 3)
    label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let firstDateLabel: UILabel = {
    let label = UILabel()
    label.text = "오늘"
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let secondDateLabel: UILabel = {
    let label = UILabel()
    label.text = "7월 19일(금)"
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let selectDateButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapSelectButton(_:)), for: .touchUpInside)
    button.tag = 2
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
//  private let possibleDateView: SelectPossibleDateView = {
//    let view = SelectPossibleDateView()
//    view.isHidden = true
//    view.translatesAutoresizingMaskIntoConstraints = false
//    return view
//  }()
  
  private let emptyContentView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let noSelectTheaterLabel: UILabel = {
    let label = UILabel()
    label.text = "선택된 영화관이 없습니다.\n영화관을 선택해 주세요."
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 13)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let noSelectTheaterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "booking_img_notheater")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let selectTheaterButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    button.setTitle("영화관 선택", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    button.addTarget(self, action: #selector(didTapSelectButton(_:)), for: .touchUpInside)
    button.tag = 3
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
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
    titleLabelBottomLine.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
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
    
    self.addSubview(selectMovieButton)
    selectMovieButton.topAnchor.constraint(equalTo: selectMovieImageView.topAnchor).isActive = true
    selectMovieButton.leadingAnchor.constraint(equalTo: selectMovieImageView.leadingAnchor).isActive = true
    selectMovieButton.trailingAnchor.constraint(equalTo: selectMovieImageView.trailingAnchor).isActive = true
    selectMovieButton.bottomAnchor.constraint(equalTo: selectMovieImageView.bottomAnchor).isActive = true
    
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
    
    selectTheaterView.addSubview(theaterTitleLabel)
    theaterTitleLabel.topAnchor.constraint(equalTo: selectTheaterView.topAnchor).isActive = true
    theaterTitleLabel.leadingAnchor.constraint(equalTo: selectTheaterView.leadingAnchor, constant: 10).isActive = true
    theaterTitleLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
    theaterTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
    selectTheaterView.addSubview(plusImageView)
    plusImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    plusImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    plusImageView.centerXAnchor.constraint(equalTo: selectTheaterView.centerXAnchor).isActive = true
    plusImageView.centerYAnchor.constraint(equalTo: selectTheaterView.centerYAnchor).isActive = true
    
    selectTheaterView.addSubview(selectTheaterLabel)
    selectTheaterLabel.topAnchor.constraint(equalTo: plusImageView.bottomAnchor).isActive = true
    selectTheaterLabel.leadingAnchor.constraint(equalTo: selectTheaterView.leadingAnchor, constant: 10).isActive = true
    selectTheaterLabel.trailingAnchor.constraint(equalTo: selectTheaterView.trailingAnchor, constant: -10).isActive = true
    selectTheaterLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    selectTheaterView.addSubview(firstSelectTheaterButton)
    firstSelectTheaterButton.topAnchor.constraint(equalTo: selectTheaterView.topAnchor).isActive = true
    firstSelectTheaterButton.leadingAnchor.constraint(equalTo: selectTheaterView.leadingAnchor).isActive = true
    firstSelectTheaterButton.trailingAnchor.constraint(equalTo: selectTheaterView.trailingAnchor).isActive = true
    firstSelectTheaterButton.bottomAnchor.constraint(equalTo: selectTheaterView.bottomAnchor).isActive = true
    
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
    
    selectDateView.addSubview(dateTitleLabel)
    dateTitleLabel.topAnchor.constraint(equalTo: selectDateView.topAnchor).isActive = true
    dateTitleLabel.leadingAnchor.constraint(equalTo: selectDateView.leadingAnchor, constant: 10).isActive = true
    dateTitleLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
    dateTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
    selectDateView.addSubview(firstDateLabel)
    firstDateLabel.leadingAnchor.constraint(equalTo: selectDateView.leadingAnchor, constant: 10).isActive = true
    firstDateLabel.trailingAnchor.constraint(equalTo: selectDateView.trailingAnchor, constant: -10).isActive = true
    firstDateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    firstDateLabel.centerXAnchor.constraint(equalTo: selectDateView.centerXAnchor).isActive = true
    firstDateLabel.centerYAnchor.constraint(equalTo: selectDateView.centerYAnchor).isActive = true
    
    selectDateView.addSubview(secondDateLabel)
    secondDateLabel.topAnchor.constraint(equalTo: firstDateLabel.bottomAnchor).isActive = true
    secondDateLabel.leadingAnchor.constraint(equalTo: selectDateView.leadingAnchor, constant: 10).isActive = true
    secondDateLabel.trailingAnchor.constraint(equalTo: selectDateView.trailingAnchor, constant: -10).isActive = true
    secondDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    selectDateView.addSubview(selectDateButton)
    selectDateButton.topAnchor.constraint(equalTo: selectDateView.topAnchor).isActive = true
    selectDateButton.leadingAnchor.constraint(equalTo: selectDateView.leadingAnchor).isActive = true
    selectDateButton.trailingAnchor.constraint(equalTo: selectDateView.trailingAnchor).isActive = true
    selectDateButton.bottomAnchor.constraint(equalTo: selectDateView.bottomAnchor).isActive = true
    
    addSubview(emptyContentView)
    emptyContentView.topAnchor.constraint(equalTo: selectDateView.bottomAnchor).isActive = true
    emptyContentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    emptyContentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    emptyContentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    emptyContentView.addSubview(noSelectTheaterLabel)
    noSelectTheaterLabel.centerXAnchor.constraint(equalTo: emptyContentView.centerXAnchor).isActive = true
    noSelectTheaterLabel.centerYAnchor.constraint(equalTo: emptyContentView.centerYAnchor).isActive = true
    noSelectTheaterLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    noSelectTheaterLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    emptyContentView.addSubview(noSelectTheaterImageView)
    noSelectTheaterImageView.bottomAnchor.constraint(equalTo: noSelectTheaterLabel.topAnchor).isActive = true
    noSelectTheaterImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    noSelectTheaterImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    noSelectTheaterImageView.centerXAnchor.constraint(equalTo: noSelectTheaterLabel.centerXAnchor).isActive = true
    
    emptyContentView.addSubview(selectTheaterButton)
    selectTheaterButton.topAnchor.constraint(equalTo: noSelectTheaterLabel.bottomAnchor, constant: 10).isActive = true
    selectTheaterButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    selectTheaterButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    selectTheaterButton.centerXAnchor.constraint(equalTo: noSelectTheaterLabel.centerXAnchor).isActive = true
    
    // MARK: - possibleDateView
//    addSubview(possibleDateView)
//    possibleDateView.topAnchor.constraint(equalTo: titleLabelBottomLine.topAnchor).isActive = true
//    possibleDateView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//    possibleDateView.trailingAnchor.constraint(equalTo: secondLine.trailingAnchor).isActive = true
//    possibleDateView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    
  }
  
  @objc func didTapDismissButton(_ sender: UIButton) {
    delegate?.touchUpDismissButton()
  }
  
  @objc func didTapSelectButton(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      delegate?.touchUpSelectMovieButton()
    case 1, 3:
      delegate?.touchUpSelectTheaterButton()
    case 2:
      delegate?.touchUpDateButton()
    default:
      return
    }
//    possibleDateView.isHidden = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
