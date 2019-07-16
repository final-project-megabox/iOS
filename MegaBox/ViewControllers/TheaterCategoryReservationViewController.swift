//
//  TheaterCategoryReservationViewController.swift
//  MegaBox
//
//  Created by Fury on 16/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryReservationViewController: UIViewController {
  
  let menuView: TheaterCategoryReservationView = {
    let view = TheaterCategoryReservationView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    setupMenuView()
  }
  
  private func setupMenuView() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(menuView)
    menuView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    menuView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    menuView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    menuView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}
