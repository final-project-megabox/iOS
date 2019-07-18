//
//  SelectPersonCountView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectPersonCountView: UIView {
  
  let okButton: UIButton = {
    let button = UIButton()
    button.setTitle("선택완료 (최대 8매 선택 가능)", for:  .normal)
    button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupProperties()
  }
  
  private func setupProperties() {
    self.addSubview(okButton)
    okButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    okButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    okButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    okButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
