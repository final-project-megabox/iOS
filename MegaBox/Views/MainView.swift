//
//  MainView.swift
//  MegaBox
//
//  Created by Fury on 04/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit



class MainView: UIView {

  // MARK: topMediaPlayView
  private let mainScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  // MARK: middle View
  private let mainBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8352941176, blue: 0.862745098, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
//  // 영화예매
//  private let movieReservationView: MovieReservationView = {
//    let view = MovieReservationView()
//    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    view.translatesAutoresizingMaskIntoConstraints = false
//    return view
//  }()
  
  


  
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
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    autoLayout()
  }
  
  private func addSubView() {
    self.addSubview(mainScrollView)
    
    
    
    mainScrollView.addSubview(mainBGView)
    mainScrollView.addSubview(lastBannerBGImageView)
    mainScrollView.addSubview(lastBannerImageView)
    
    // 진행중
//    mainScrollView.addSubview(movieReservationView)
//    mainScrollView.addSubview(shortMenuView)
//    mainScrollView.addSubview(firstAdView)
//    mainScrollView.addSubview(eventView)
//    mainScrollView.addSubview(movieBoxView)
//    mainScrollView.addSubview(secondAdView)
//    mainScrollView.addSubview(moviePostView)
//    mainScrollView.addSubview(notiView)
//    mainScrollView.addSubview(notificationView)
    
    
    
    lastBannerImageView.contentMode = .scaleAspectFit
  }
  
  private func autoLayout() {
    let margin: CGFloat = 10
    NSLayoutConstraint.activate([
      mainScrollView.topAnchor.constraint(equalTo: self.topAnchor),
      mainScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      
      
      mainBGView.topAnchor.constraint(equalTo: self.topAnchor),
      mainBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainBGView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainBGView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
      
//      movieReservationView.topAnchor.constraint(equalTo: mainBGView.topAnchor, constant: margin),
//      movieReservationView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
//      movieReservationView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
//      movieReservationView.heightAnchor.constraint(equalToConstant: 400),
//      
//      shortMenuView.topAnchor.constraint(equalTo: movieReservationView.bottomAnchor, constant: margin),
//      shortMenuView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
//      shortMenuView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
//      shortMenuView.heightAnchor.constraint(equalToConstant: 90),
//      
//      firstAdView.topAnchor.constraint(equalTo: shortMenuView.bottomAnchor, constant: margin),
//      firstAdView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
//      firstAdView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
//      firstAdView.heightAnchor.constraint(equalToConstant: 90),
//      
//      eventView.topAnchor.constraint(equalTo: firstAdView.bottomAnchor, constant: margin),
//      eventView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
//      eventView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
//      eventView.heightAnchor.constraint(equalToConstant: 400),
//      
//      movieBoxView.topAnchor.constraint(equalTo: eventView.bottomAnchor, constant: margin),
//      movieBoxView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
//      movieBoxView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
//      
//      secondAdView.topAnchor.constraint(equalTo: movieBoxView.bottomAnchor, constant: margin),
//      secondAdView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor),
//      secondAdView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor),
//      secondAdView.heightAnchor.constraint(equalToConstant: 100),
//      
//      moviePostView.topAnchor.constraint(equalTo: secondAdView.bottomAnchor, constant: margin),
//      moviePostView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
//      moviePostView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
//      moviePostView.heightAnchor.constraint(equalToConstant: 400),
//      
//      notiView.topAnchor.constraint(equalTo: moviePostView.bottomAnchor, constant: margin),
//      notiView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
//      notiView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
//      notiView.heightAnchor.constraint(equalToConstant: 400),
//      
//      notificationView.topAnchor.constraint(equalTo: notiView.bottomAnchor, constant: margin),
//      notificationView.leadingAnchor.constraint(equalTo: mainBGView.leadingAnchor, constant: margin),
//      notificationView.trailingAnchor.constraint(equalTo: mainBGView.trailingAnchor, constant: -margin),
//      notificationView.heightAnchor.constraint(equalToConstant: 400),
//      
//      lastBannerBGImageView.topAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: margin),
//      lastBannerBGImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//      lastBannerBGImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//      lastBannerBGImageView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
//      lastBannerBGImageView.heightAnchor.constraint(equalToConstant: 70),
//      
//      lastBannerImageView.topAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: margin),
//      lastBannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//      lastBannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//      lastBannerImageView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
//      lastBannerImageView.heightAnchor.constraint(equalToConstant: 70),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
