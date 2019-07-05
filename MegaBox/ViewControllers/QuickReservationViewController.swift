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
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    setupQuickReservationView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    setAnimations()
  }
  
  private func setupQuickReservationView() {
    addSubView()
    autoLayout()
  }
  
  private func setAnimations() {
    UIView.animate(withDuration: 0.3) {
      self.quickReservationView.topView.transform = CGAffineTransform(translationX: 0, y: 250)
    }
    
    UIView.animate(withDuration: 0.3) {
      self.quickReservationView.bottomImageView.transform = CGAffineTransform(translationX: 0, y: -130)
    }
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
