//
//  QuickReservationViewController.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class QuickReservationViewController: UIViewController {
  
  private let quickReservationView: QuickReservationView = {
    let view = QuickReservationView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupQuickReservationView()
  }
  
  private func setupQuickReservationView() {
    addSubView()
    autoLayout()
  }
  
  private func addSubView() {
    view.addSubview(quickReservationView)
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      quickReservationView.topAnchor.constraint(equalTo: guide.topAnchor),
      quickReservationView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      quickReservationView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      quickReservationView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      ])
  } 
}
