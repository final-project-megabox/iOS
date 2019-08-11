//
//  QuickReservationViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
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
    quickReservationView.delegate = self
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    startAnimations(isCancel: false)
  }
  
  private func setupQuickReservationView() {
    addSubView()
    autoLayout()
  }
  
  private func startAnimations(isCancel: Bool) {
    if isCancel {
      UIView.animate(withDuration: 0.3) {
        self.quickReservationView.topView.transform = CGAffineTransform(translationX: 0, y: -250)
      }
      
      UIView.animate(withDuration: 0.3, animations: {
        self.quickReservationView.bottomImageView.transform = CGAffineTransform(translationX: 0, y: 130)
      }) { (Bool) in
        self.dismiss(animated: false)
      }
      
    } else {
      UIView.animate(withDuration: 0.3) {
        self.quickReservationView.topView.transform = CGAffineTransform(translationX: 0, y: 250)
      }
      
      UIView.animate(withDuration: 0.3) {
        self.quickReservationView.bottomImageView.transform = CGAffineTransform(translationX: 0, y: -130)
      }
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

extension QuickReservationViewController: QuickReservationViewDelegate {
  func touchUpfarightButton() {
    let movieCategoryVC = MovieCategoryReservationViewController()
    movieCategoryVC.dismissType = .two
    self.present(movieCategoryVC, animated: false)
  }
  
  func touchUpfaleftButton() {
    NetworkService.getRegionData { result in
      switch result {
      case .success(let data):
        let theaterCategoryVC = TheaterCategorySelectTheaterViewController()
        theaterCategoryVC.dismissType = .two
        theaterCategoryVC.regionData = data
        self.present(theaterCategoryVC, animated: false)
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
  }
  
  func touchUpCancelButton() {
    startAnimations(isCancel: true)
  }
}
