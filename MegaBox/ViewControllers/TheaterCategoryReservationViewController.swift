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
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    setupMenuView()
  }
  
  private func setupMenuView() {
    
  }
}
