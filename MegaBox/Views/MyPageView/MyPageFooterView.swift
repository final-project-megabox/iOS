//
//  MyPageFooterView.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageFooterView: UIView {
  
  let footerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.appColor(.selectedCellGrayColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupFooterView()
  }
  
  
  func setupFooterView() {
    addSubview(footerView)
    footerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    footerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    footerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    footerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
