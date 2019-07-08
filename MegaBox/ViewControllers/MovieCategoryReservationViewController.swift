//
//  MovieCategoryReservationViewController.swift
//  MegaBox
//
//  Created by 차수연 on 06/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieCategoryReservationViewController: UIViewController {
  
  let menuView = MenuTitleView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupMenuView()
  }
  
  private func setupMenuView() {
    view.addSubview(menuView)
    menuView.translatesAutoresizingMaskIntoConstraints = false
    let guide = view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      menuView.topAnchor.constraint(equalTo: guide.topAnchor),
      menuView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      menuView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      menuView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      ])
  }
}
