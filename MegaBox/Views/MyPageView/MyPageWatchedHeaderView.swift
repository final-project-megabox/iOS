//
//  MyPageWatchedHeaderView.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageWatchedHeaderView: UIView {

  let firstImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "common_icon_angle_rignt")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let firstLabel: UILabel = {
    let label = UILabel()
    label.text = "본 영화 리스트는 실제 관람한 이력으로 보여지며, 상영일 익일에 자동 노출됩니다."
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let secondImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "common_icon_angle_rignt")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let secondLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관에서 발권하신 티켓 바코드 하단의 거래번호를 통해 본 영화 등록을 하실 수 있습니다."
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let thirdImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "common_icon_angle_rignt")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let thirdLabel: UILabel = {
    let label = UILabel()
    label.text = "유료 관람 영화 편수는 나의 메가박스 > '멤버십 포인트정보' 에서 확인 하실 수 있습니다."
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let bottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.appColor(.megaBoxColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.appColor(.selectedCellGrayColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let enrollButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.appColor(.megaBoxColor)
    button.setTitle("본 영화 등록", for: .normal)
    button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupHeaderView()
  }
  
  func setupHeaderView() {
    addSubview(firstImageView)
    firstImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    firstImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    firstImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
    firstImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    addSubview(firstLabel)
    firstLabel.topAnchor.constraint(equalTo: firstImageView.topAnchor).isActive = true
    firstLabel.leadingAnchor.constraint(equalTo: firstImageView.trailingAnchor, constant: 5).isActive = true
    firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    
    
    addSubview(secondImageView)
    secondImageView.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 5).isActive = true
    secondImageView.leadingAnchor.constraint(equalTo: firstImageView.leadingAnchor).isActive = true
    secondImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
    secondImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    addSubview(secondLabel)
    secondLabel.topAnchor.constraint(equalTo: secondImageView.topAnchor).isActive = true
    secondLabel.leadingAnchor.constraint(equalTo: secondImageView.trailingAnchor, constant: 5).isActive = true
    secondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    
    addSubview(thirdImageView)
    thirdImageView.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 5).isActive = true
    thirdImageView.leadingAnchor.constraint(equalTo: firstImageView.leadingAnchor).isActive = true
    thirdImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
    thirdImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    addSubview(thirdLabel)
    thirdLabel.topAnchor.constraint(equalTo: thirdImageView.topAnchor).isActive = true
    thirdLabel.leadingAnchor.constraint(equalTo: thirdImageView.trailingAnchor, constant: 5).isActive = true
    thirdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    
    addSubview(backgroundView)
    backgroundView.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 20).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    backgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    backgroundView.addSubview(enrollButton)
    enrollButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    enrollButton.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
    enrollButton.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.8).isActive = true
    enrollButton.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.8).isActive = true
    
    
    addSubview(bottomLine)
    bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    bottomLine.bottomAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
    bottomLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
    
    
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
