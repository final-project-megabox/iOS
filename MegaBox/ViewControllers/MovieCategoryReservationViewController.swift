//
//  MovieCategoryReservationViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

enum DismissType {
  case one
  case two
}

class MovieCategoryReservationViewController: UIViewController {
  
  let menuView: MovieCategoryReservationView = {
    let view = MovieCategoryReservationView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var dismissType: DismissType = .one
  
  override func viewDidLoad() {
    super.viewDidLoad()
    menuView.reservationDelegate = self
    setupMenuView()
    
  }
  
  private func setupMenuView() {
    view.addSubview(menuView)
    
    let guide = view.safeAreaLayoutGuide
    
      menuView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      menuView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      menuView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
      menuView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
  }
}

extension MovieCategoryReservationViewController: MovieCategoryReservationViewDelegate {
  func touchUpButton(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      sender.touchUpButton(isTouched: true, width: menuView.allMovieButton.frame.width)
      menuView.curationButton.touchUpButton(isTouched: false, width: 0)
    case 1:
      menuView.allMovieButton.touchUpButton(isTouched: false, width: 0)
      sender.touchUpButton(isTouched: true, width: menuView.curationButton.frame.width)
    default:
      break
    }
  }
  
  func dismissButtonDidTapped() {
    switch dismissType {
    case .one:
      self.presentingViewController?.dismiss(animated: false)
    case .two:
      self.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
    
  }
  
  func touchUpSelectMovieButton() {
    let selectTheaterVC = MovieCategorySelectTheatherViewController()
    present(selectTheaterVC, animated: false)
  }
  
}
