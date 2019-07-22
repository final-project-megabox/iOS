//
//  SelectTheaterViewController.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterViewController: UIViewController {
  
  private let selectTheaterView: TheaterCategorySelectTheaterView = {
    let view = TheaterCategorySelectTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectTheaterView.delegate = self
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    setupSelectTheaterView()
  }
  
  private func setupSelectTheaterView() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(selectTheaterView)
    selectTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    selectTheaterView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    selectTheaterView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    selectTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension TheaterCategorySelectTheaterViewController: TheaterCategorySelectTheaterViewDelegate {
  func touchUpmenuTitleSelectbutton() {
    let theaterCategoryReservationVC = TheaterCategoryReservationViewController()
    
    self.present(theaterCategoryReservationVC, animated: false)
  }

  func touchUpCancelButton() {
  self.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
}


