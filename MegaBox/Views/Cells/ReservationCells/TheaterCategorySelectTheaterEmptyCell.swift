//
//  TheaterCategorySelectTheaterEmptyCell.swift
//  MegaBox
//
//  Created by Fury on 22/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterEmptyCell: UITableViewCell {
  static let identifier = "TheaterCategorySelectTheaterEmptyCell"
  
  private let explainLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(
      text: """
            자주찾는 메가박스
            영화관을 선호영화관으로
            등록해주세요.
            """,
      color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),
      fontSize: 12,
      alignment: .center
    )
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let favoriteTheaterButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    button.setTitle("선호영화관 등록", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(explainLabel)
    explainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin * 5).isActive = true
    explainLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    
    contentView.addSubview(favoriteTheaterButton)
    favoriteTheaterButton.topAnchor.constraint(equalTo: explainLabel.bottomAnchor, constant: margin * 2).isActive = true
    favoriteTheaterButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
