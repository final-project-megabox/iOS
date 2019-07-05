//
//  MainView.swift
//  MegaBox
//
//  Created by Fury on 04/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainView: UIView {
  
  // MARK:- Properties
  // MARK: topProperties
  private let topView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.alpha = 0.3
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let hamburgerMenu: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "hamburger_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let titleImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "megaboxkids_logo_w")
    imageView.contentMode = .left
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let quickReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("빠른예매", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 2
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: topMediaPlayView
  private let mainScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private let topMediaPlayView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "image1")
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let topMediaTitleText: UITextField = {
    let textField = UITextField()
    textField.text = "스파이더맨: 파 프롬 홈"
    textField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    textField.font = UIFont.systemFont(ofSize: 18, weight: .black)
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let topMediaSubTitleText: UITextField = {
    let textField = UITextField()
    textField.text = "모든 것이 다시 시작된다!"
    textField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    textField.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let viewDetailButton: UIButton = {
    let button = UIButton()
    button.setTitle("상세보기", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 2
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: middle View
  private let mainBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 영화예매
  private let movieReservationView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 영화관 할인카드 스토어 포토카드
  private let temp1: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 광고
  private let temp2: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 이벤트
  private let eventView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 무비박스
  private let movieBoxView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 광고
  private let temp3: UIView = {
    let view = UIView()
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
  
  private func setupProperties() {
    addSubView()
    autoLayout()
  }
  
  private func addSubView() {
    self.addSubview(mainScrollView)
    mainScrollView.addSubview(topMediaPlayView)
    topMediaPlayView.addSubview(topMediaTitleText)
    topMediaPlayView.addSubview(topMediaSubTitleText)
    topMediaPlayView.addSubview(viewDetailButton)
    mainScrollView.addSubview(mainBGView)
    mainScrollView.addSubview(lastBannerBGImageView)
    mainScrollView.addSubview(lastBannerImageView)
    
    // 진행중
    mainScrollView.addSubview(movieReservationView)
    mainScrollView.addSubview(temp1)
    mainScrollView.addSubview(temp2)
    mainScrollView.addSubview(eventView)
    mainScrollView.addSubview(movieBoxView)
    mainScrollView.addSubview(temp3)
    mainScrollView.addSubview(moviePostView)
    mainScrollView.addSubview(notiView)
    mainScrollView.addSubview(notificationView)
    
    self.addSubview(topView)
    self.addSubview(hamburgerMenu)
    self.addSubview(titleImage)
    self.addSubview(quickReservationButton)
    topMediaPlayView.contentMode = .scaleToFill
    lastBannerImageView.contentMode = .scaleAspectFit
  }
  
  private func autoLayout() {
    let margin: CGFloat = 15
    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: self.topAnchor),
      topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      topView.heightAnchor.constraint(equalToConstant: 50),
      
      hamburgerMenu.topAnchor.constraint(equalTo: self.topAnchor),
      hamburgerMenu.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
      hamburgerMenu.heightAnchor.constraint(equalToConstant: 50),
      
      titleImage.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
      titleImage.leadingAnchor.constraint(equalTo: hamburgerMenu.trailingAnchor, constant: margin),
      titleImage.heightAnchor.constraint(equalToConstant: 20),
      titleImage.widthAnchor.constraint(equalToConstant: 80),
      
      quickReservationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.5),
      quickReservationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
      quickReservationButton.heightAnchor.constraint(equalToConstant: 25),
      
      mainScrollView.topAnchor.constraint(equalTo: self.topAnchor),
      mainScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      topMediaPlayView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
      topMediaPlayView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topMediaPlayView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      topMediaPlayView.heightAnchor.constraint(equalToConstant: 320),
      
      topMediaTitleText.leadingAnchor.constraint(equalTo: topMediaPlayView.leadingAnchor, constant: margin * 2),
      
      topMediaSubTitleText.topAnchor.constraint(equalTo: topMediaTitleText.bottomAnchor, constant: 5),
      topMediaSubTitleText.leadingAnchor.constraint(equalTo: topMediaPlayView.leadingAnchor, constant: margin * 2),
      topMediaSubTitleText.bottomAnchor.constraint(equalTo: topMediaPlayView.bottomAnchor, constant: -margin),
      
      viewDetailButton.trailingAnchor.constraint(equalTo: topMediaPlayView.trailingAnchor, constant: -margin * 2),
      viewDetailButton.bottomAnchor.constraint(equalTo: topMediaPlayView.bottomAnchor, constant: -25),
      viewDetailButton.heightAnchor.constraint(equalToConstant: 25),
      
      mainBGView.topAnchor.constraint(equalTo: topMediaPlayView.bottomAnchor),
      mainBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainBGView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainBGView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
      
      
      movieReservationView.topAnchor.constraint(equalTo: mainBGView.topAnchor, constant: margin),
      movieReservationView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      movieReservationView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      movieReservationView.heightAnchor.constraint(equalToConstant: 400),
      
      temp1.topAnchor.constraint(equalTo: movieReservationView.bottomAnchor, constant: margin),
      temp1.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
      temp1.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
      temp1.heightAnchor.constraint(equalToConstant: 100),
      
      temp2.topAnchor.constraint(equalTo: temp1.bottomAnchor, constant: margin),
      temp2.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
      temp2.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
      temp2.heightAnchor.constraint(equalToConstant: 100),
      
      eventView.topAnchor.constraint(equalTo: temp2.bottomAnchor, constant: margin),
      eventView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      eventView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      eventView.heightAnchor.constraint(equalToConstant: 400),
      
      movieBoxView.topAnchor.constraint(equalTo: eventView.bottomAnchor, constant: margin),
      movieBoxView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
      movieBoxView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
      movieBoxView.heightAnchor.constraint(equalToConstant: 400),
      
      temp3.topAnchor.constraint(equalTo: movieBoxView.bottomAnchor, constant: margin),
      temp3.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
      temp3.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
      temp3.heightAnchor.constraint(equalToConstant: 100),
      
      moviePostView.topAnchor.constraint(equalTo: temp3.bottomAnchor, constant: margin),
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
