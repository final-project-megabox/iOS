//
//  MainView.swift
//  MegaBox
//
//  Created by Fury on 04/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol MainViewDelegate: class {
  func openQuickReservationView()
}

class MainView: UIView {
  
  // MARK:- Properties
  var delegate: MainViewDelegate?
  var titleImageHeight: CGFloat = 0
  
  // MARK: topProperties
  private let topMediaVisualTopView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.alpha = 0.3
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let hamburgerMenu: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_top_menu_white_btn"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let titleImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "main_top_logo_white")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let quickReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("빠른예매", for: .normal)
    button.addTarget(self, action: #selector(quickReservationButtonDidTapped), for: .touchUpInside)
    button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: topMediaPlayView
  private let mainScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private let topMediaImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "image1")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let topMediaVisualBottomView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "main_moviebox_gradation")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let topMediaPlayButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_moviebox_play_btn"), for: .normal)
    button.alpha = 0.8
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let topMediaTitleText: UITextField = {
    let textField = UITextField()
    textField.text = "스파이더맨: 파 프롬 홈"
    textField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    textField.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let topMediaSubTitleText: UITextField = {
    let textField = UITextField()
    textField.text = "모든 것이 다시 시작된다!"
    textField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    textField.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let viewDetailButton: UIButton = {
    let button = UIButton()
    button.setTitle("상세보기", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: middle View
  private let mainBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8352941176, blue: 0.862745098, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 영화예매
  private let movieReservationView: MovieReservationView = {
    let view = MovieReservationView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 영화관 할인카드 스토어 포토카드
  private let shortMenuView: ShortMenuView = {
    let view = ShortMenuView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 광고
  private let firstAdView: AdView = {
    let view = AdView()
    view.adImage.image = #imageLiteral(resourceName: "first_ad")
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 이벤트
  private let eventView: MovieReservationView = {
    let view = MovieReservationView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 무비박스
  private let movieBoxView: MovieBoxView = {
    let view = MovieBoxView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 광고
  private let secondAdView: AdView = {
    let view = AdView()
    view.adImage.image = #imageLiteral(resourceName: "second_ad")
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 무비포스트
  private let moviePostView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 지점소식
  private let notiView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 공지사항
  private let notificationView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let lastBannerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "lastbanner")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let lastBannerBGImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "newmain_boutiquebg")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  @objc private func quickReservationButtonDidTapped() {
    delegate?.openQuickReservationView()
  }
  
  private func setupProperties() {
    addSubView()
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    titleImageHeight = (self.frame.width * 907) / 1080
    autoLayout()
  }
  
  private func addSubView() {
    self.addSubview(mainScrollView)
    mainScrollView.addSubview(topMediaImageView)
    topMediaImageView.addSubview(topMediaVisualBottomView)
    topMediaImageView.addSubview(topMediaPlayButton)
    topMediaImageView.addSubview(topMediaTitleText)
    topMediaImageView.addSubview(topMediaSubTitleText)
    topMediaImageView.addSubview(viewDetailButton)
    
    
    mainScrollView.addSubview(mainBGView)
    mainScrollView.addSubview(lastBannerBGImageView)
    mainScrollView.addSubview(lastBannerImageView)
    
    // 진행중
    mainScrollView.addSubview(movieReservationView)
    mainScrollView.addSubview(shortMenuView)
    mainScrollView.addSubview(firstAdView)
    mainScrollView.addSubview(eventView)
    mainScrollView.addSubview(movieBoxView)
    mainScrollView.addSubview(secondAdView)
    mainScrollView.addSubview(moviePostView)
    mainScrollView.addSubview(notiView)
    mainScrollView.addSubview(notificationView)
    
    self.addSubview(topMediaVisualTopView)
    self.addSubview(hamburgerMenu)
    self.addSubview(titleImage)
    self.addSubview(quickReservationButton)
    
    lastBannerImageView.contentMode = .scaleAspectFit
  }
  
  private func autoLayout() {
    let margin: CGFloat = 10
    NSLayoutConstraint.activate([
      topMediaVisualTopView.topAnchor.constraint(equalTo: self.topAnchor),
      topMediaVisualTopView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topMediaVisualTopView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      hamburgerMenu.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
      hamburgerMenu.centerYAnchor.constraint(equalTo: topMediaVisualTopView.centerYAnchor),
      hamburgerMenu.heightAnchor.constraint(equalToConstant: 20),
      hamburgerMenu.widthAnchor.constraint(equalToConstant: 20),
      
      titleImage.leadingAnchor.constraint(equalTo: hamburgerMenu.trailingAnchor, constant: margin * 2),
      titleImage.centerYAnchor.constraint(equalTo: topMediaVisualTopView.centerYAnchor),
      titleImage.heightAnchor.constraint(equalToConstant: 20),
      titleImage.widthAnchor.constraint(equalToConstant: 120),
      
      quickReservationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
      quickReservationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
      quickReservationButton.centerYAnchor.constraint(equalTo: topMediaVisualTopView.centerYAnchor),
      quickReservationButton.heightAnchor.constraint(equalToConstant: 25),
      
      mainScrollView.topAnchor.constraint(equalTo: self.topAnchor),
      mainScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      topMediaImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
      topMediaImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topMediaImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      topMediaImageView.heightAnchor.constraint(equalToConstant: titleImageHeight),
      
      topMediaPlayButton.centerXAnchor.constraint(equalTo: topMediaImageView.centerXAnchor),
      topMediaPlayButton.centerYAnchor.constraint(equalTo: topMediaImageView.centerYAnchor),
      
      topMediaVisualBottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topMediaVisualBottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      topMediaVisualBottomView.bottomAnchor.constraint(equalTo: topMediaImageView.bottomAnchor),
      topMediaVisualBottomView.heightAnchor.constraint(equalToConstant: 85),
      
      topMediaTitleText.leadingAnchor.constraint(equalTo: topMediaImageView.leadingAnchor, constant: margin * 3),
      topMediaTitleText.bottomAnchor.constraint(equalTo: topMediaSubTitleText.topAnchor),
      
      topMediaSubTitleText.leadingAnchor.constraint(equalTo: topMediaImageView.leadingAnchor, constant: margin * 3),
      topMediaSubTitleText.bottomAnchor.constraint(equalTo: topMediaImageView.bottomAnchor, constant: -margin * 2),
      
      viewDetailButton.trailingAnchor.constraint(equalTo: topMediaImageView.trailingAnchor, constant: -margin * 2),
      viewDetailButton.bottomAnchor.constraint(equalTo: topMediaImageView.bottomAnchor, constant: -25),
      viewDetailButton.heightAnchor.constraint(equalToConstant: 25),
      
      mainBGView.topAnchor.constraint(equalTo: topMediaImageView.bottomAnchor),
      mainBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainBGView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainBGView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
      
      movieReservationView.topAnchor.constraint(equalTo: mainBGView.topAnchor, constant: margin),
      movieReservationView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      movieReservationView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      movieReservationView.heightAnchor.constraint(equalToConstant: 400),
      
      shortMenuView.topAnchor.constraint(equalTo: movieReservationView.bottomAnchor, constant: margin),
      shortMenuView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
      shortMenuView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
      shortMenuView.heightAnchor.constraint(equalToConstant: 90),
      
      firstAdView.topAnchor.constraint(equalTo: shortMenuView.bottomAnchor, constant: margin),
      firstAdView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
      firstAdView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
      firstAdView.heightAnchor.constraint(equalToConstant: 90),
      
      eventView.topAnchor.constraint(equalTo: firstAdView.bottomAnchor, constant: margin),
      eventView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      eventView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      eventView.heightAnchor.constraint(equalToConstant: 400),
      
      movieBoxView.topAnchor.constraint(equalTo: eventView.bottomAnchor, constant: margin),
      movieBoxView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      movieBoxView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      
      secondAdView.topAnchor.constraint(equalTo: movieBoxView.bottomAnchor, constant: margin),
      secondAdView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
      secondAdView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
      secondAdView.heightAnchor.constraint(equalToConstant: 100),
      
      moviePostView.topAnchor.constraint(equalTo: secondAdView.bottomAnchor, constant: margin),
      moviePostView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      moviePostView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      moviePostView.heightAnchor.constraint(equalToConstant: 400),
      
      notiView.topAnchor.constraint(equalTo: moviePostView.bottomAnchor, constant: margin),
      notiView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      notiView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      notiView.heightAnchor.constraint(equalToConstant: 400),
      
      notificationView.topAnchor.constraint(equalTo: notiView.bottomAnchor, constant: margin),
      notificationView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      notificationView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      notificationView.heightAnchor.constraint(equalToConstant: 400),
      
      lastBannerBGImageView.topAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: margin),
      lastBannerBGImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      lastBannerBGImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      lastBannerBGImageView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
      lastBannerBGImageView.heightAnchor.constraint(equalToConstant: 70),
      
      lastBannerImageView.topAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: margin),
      lastBannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      lastBannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      lastBannerImageView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
      lastBannerImageView.heightAnchor.constraint(equalToConstant: 70),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
