//
//  NavigationDrawerView.swift
//  MegaBox
//
//  Created by Fury on 10/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class NavigationDrawerView: UIView {
  
  private var naviDrawerTopStack = UIStackView()
  private let naviDrawerHomeButton = UIButton()
  private let naviDrawerDivisionLine = UIView()
  private let naviDrawerNoticeButton = UIButton()
  private let naviDrawerSettingButton = UIButton()
  private let naviDrawerBarcodeButton = UIButton()
  
  private let naviDrawerCancelButton = UIButton()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    setupStackViews()
  }
  
  private func setupStackViews() {
    naviDrawerTopStack = UIStackView(arrangedSubviews: [naviDrawerHomeButton, naviDrawerDivisionLine, naviDrawerNoticeButton, naviDrawerSettingButton, naviDrawerBarcodeButton])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
