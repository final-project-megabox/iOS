//
//  MyPageThreeContentCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageThreeContentCell: UITableViewCell {
  
  let contentViewTopLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.appColor(.defaultGrayColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //
  let firstView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let firstContentLabel: UILabel = {
    let label = UILabel()
    label.text = "text"
    label.textColor = UIColor.appColor(.darkBgColor)
    label.font = UIFont.systemFont(ofSize: 16, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let firstCountLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    label.textColor = UIColor.appColor(.megaBoxColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let firstContentImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "btn_slide_blut")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let firstContentViewBottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.appColor(.defaultGrayColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  //
  
  let secondView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let secondContentLabel: UILabel = {
    let label = UILabel()
    label.text = "text"
    label.textColor = UIColor.appColor(.darkBgColor)
    label.font = UIFont.systemFont(ofSize: 16, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let secondCountLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    label.textColor = UIColor.appColor(.megaBoxColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let secondContentImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "btn_slide_blut")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let secondContentViewBottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.appColor(.defaultGrayColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //third
  let thirdView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let thirdContentLabel: UILabel = {
    let label = UILabel()
    label.text = "text"
    label.textColor = UIColor.appColor(.darkBgColor)
    label.font = UIFont.systemFont(ofSize: 16, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let thirdCountLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    label.textColor = UIColor.appColor(.megaBoxColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let thirdContentImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "btn_slide_blut")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let thirdContentViewBottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = UIColor.appColor(.defaultGrayColor)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  
  //////////
  let separatView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.appColor(.selectedCellGrayColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupContentCell()
  }
  
  
  private func setupContentCell() {
    addSubview(contentViewTopLine)
    
    addSubview(firstView)
    firstView.addSubview(firstContentLabel)
    firstView.addSubview(firstCountLabel)
    firstView.addSubview(firstContentImageView)
    addSubview(firstContentViewBottomLine)
    
    addSubview(secondView)
    secondView.addSubview(secondContentLabel)
    secondView.addSubview(secondCountLabel)
    secondView.addSubview(secondContentImageView)
    addSubview(secondContentViewBottomLine)
    
    //third
    addSubview(thirdView)
    thirdView.addSubview(thirdContentLabel)
    thirdView.addSubview(thirdCountLabel)
    thirdView.addSubview(thirdContentImageView)
    addSubview(thirdContentViewBottomLine)
    
    
    addSubview(separatView)
    
    
    contentViewTopLine.topAnchor.constraint(equalTo: topAnchor).isActive = true
    contentViewTopLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    contentViewTopLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    contentViewTopLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    
    //
    
    firstView.topAnchor.constraint(equalTo: contentViewTopLine.bottomAnchor).isActive = true
    firstView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    firstView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    firstView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    
    firstContentLabel.topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
    firstContentLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10).isActive = true
    firstContentLabel.bottomAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
    
    firstCountLabel.topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
    firstCountLabel.leadingAnchor.constraint(equalTo: firstContentLabel.trailingAnchor).isActive = true
    firstCountLabel.bottomAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
    firstCountLabel.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.1).isActive = true
    
    
    firstContentImageView.topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
    firstContentImageView.leadingAnchor.constraint(equalTo: firstCountLabel.trailingAnchor).isActive = true
    firstContentImageView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor).isActive = true
    firstContentImageView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
    firstContentImageView.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.1).isActive = true
    
    
    firstContentViewBottomLine.topAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
    firstContentViewBottomLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    firstContentViewBottomLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    firstContentViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    //
    
    
    secondView.topAnchor.constraint(equalTo: firstContentViewBottomLine.bottomAnchor).isActive = true
    secondView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    secondView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    secondView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    
    secondContentLabel.topAnchor.constraint(equalTo: secondView.topAnchor).isActive = true
    secondContentLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 10).isActive = true
    secondContentLabel.bottomAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
    
    secondCountLabel.topAnchor.constraint(equalTo: secondView.topAnchor).isActive = true
    secondCountLabel.leadingAnchor.constraint(equalTo: secondContentLabel.trailingAnchor).isActive = true
    secondCountLabel.bottomAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
    secondCountLabel.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.1).isActive = true
    
    
    secondContentImageView.topAnchor.constraint(equalTo: secondView.topAnchor).isActive = true
    secondContentImageView.leadingAnchor.constraint(equalTo: secondCountLabel.trailingAnchor).isActive = true
    secondContentImageView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor).isActive = true
    secondContentImageView.bottomAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
    secondContentImageView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.1).isActive = true
    
    
    secondContentViewBottomLine.topAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
    secondContentViewBottomLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    secondContentViewBottomLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    secondContentViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    
    //third
    
    thirdView.topAnchor.constraint(equalTo: secondContentViewBottomLine.bottomAnchor).isActive = true
    thirdView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    thirdView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    thirdView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    
    thirdContentLabel.topAnchor.constraint(equalTo: thirdView.topAnchor).isActive = true
    thirdContentLabel.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 10).isActive = true
    thirdContentLabel.bottomAnchor.constraint(equalTo: thirdView.bottomAnchor).isActive = true
    
    thirdCountLabel.topAnchor.constraint(equalTo: thirdView.topAnchor).isActive = true
    thirdCountLabel.leadingAnchor.constraint(equalTo: thirdContentLabel.trailingAnchor).isActive = true
    thirdCountLabel.bottomAnchor.constraint(equalTo: thirdView.bottomAnchor).isActive = true
    thirdCountLabel.widthAnchor.constraint(equalTo: thirdView.widthAnchor, multiplier: 0.1).isActive = true
    
    
    thirdContentImageView.topAnchor.constraint(equalTo: thirdView.topAnchor).isActive = true
    thirdContentImageView.leadingAnchor.constraint(equalTo: thirdCountLabel.trailingAnchor).isActive = true
    thirdContentImageView.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor).isActive = true
    thirdContentImageView.bottomAnchor.constraint(equalTo: thirdView.bottomAnchor).isActive = true
    thirdContentImageView.widthAnchor.constraint(equalTo: thirdView.widthAnchor, multiplier: 0.1).isActive = true
    
    
    thirdContentViewBottomLine.topAnchor.constraint(equalTo: thirdView.bottomAnchor).isActive = true
    thirdContentViewBottomLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    thirdContentViewBottomLine.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    thirdContentViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    //////
    separatView.topAnchor.constraint(equalTo: thirdContentViewBottomLine.bottomAnchor).isActive = true
    separatView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    separatView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    separatView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    separatView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
