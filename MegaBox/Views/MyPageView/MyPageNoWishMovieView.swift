//
//  MyPageNoWishMovieView.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageNoWishMovieView: UIView {
  
  let wishedImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "booking_img_notheater")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "보고싶은 영화가 없습니다."
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let subTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "상세페이지에서 ❤️를 클릭하여 추가해보세요."
    label.font = UIFont.systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.appColor(.selectedCellGrayColor)
    setupView()
  }
  
  
  func setupView() {
    addSubview(wishedImageView)
    wishedImageView.topAnchor.constraint(equalTo: topAnchor, constant: 300).isActive = true
    wishedImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    wishedImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    wishedImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: wishedImageView.bottomAnchor, constant: 50).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: wishedImageView.centerXAnchor).isActive = true
    
    addSubview(subTitleLabel)
    subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    subTitleLabel.centerXAnchor.constraint(equalTo: wishedImageView.centerXAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
