//
//  MainFooterCell.swift
//  MegaBox
//
//  Created by Fury on 29/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainFooterCell: UITableViewCell {
  static let identifier = "MainFooterCell"
  
  
  private var footerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "main_footer")
    imageView.contentMode = .scaleAspectFit
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8352941176, blue: 0.862745098, alpha: 1)
    setupFooterImageView()
    let gesture = UITapGestureRecognizer(target: self, action: #selector(touchUpFooter))
    footerImageView.addGestureRecognizer(gesture)
  }
  
  @objc private func touchUpFooter() {
    print("hellsss")
  }
  
  private func setupFooterImageView() {
    contentView.addSubview(footerImageView)
    footerImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    footerImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
