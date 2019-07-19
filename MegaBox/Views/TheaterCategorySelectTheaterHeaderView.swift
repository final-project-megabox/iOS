//
//  TheaterCategorySelectTheaterHeaderView.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterHeaderView: UIView {
  
  let titleButton: UIButton = {
    let button = UIButton()
    button.titleLabel?.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  private func setupProperties() {
    titleButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    titleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    titleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    titleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
