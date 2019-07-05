//
//  ViewController.swift
//  MegaBox
//
//  Created by Fury on 04/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private let mainVC = MainView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .black
    
    mainVC.delegate = self
    setupMainVC()
  }
  
  private func setupMainVC() {
    mainVC.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(mainVC)
    let guide = view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      mainVC.topAnchor.constraint(equalTo: guide.topAnchor),
      mainVC.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      mainVC.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      mainVC.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      ])
  }
}

extension MainViewController: MainViewDelegate {
  func openQuickReservationView() {
    let quickReservationVC = QuickReservationViewController()
    quickReservationVC.modalPresentationStyle = .overCurrentContext
    self.present(quickReservationVC, animated: false)
  }
}

