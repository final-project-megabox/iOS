//
//  MovieCategoryReservationViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieCategoryReservationViewController: UIViewController {
  
  let menuView = MovieCategoryReservationView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    menuView.reservationDelegate = self
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

extension MovieCategoryReservationViewController: MovieCategoryReservationViewDelegate {
  func dismissButtonDidTapped() {
    self.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
}
