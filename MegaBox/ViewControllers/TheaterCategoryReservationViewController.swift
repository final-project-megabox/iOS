//
//  TheaterCategoryReservationViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryReservationViewController: UIViewController {
  // MARK:- Properties
  var numPages: Int = 0
  
  let menuView: TheaterCategoryReservationView = {
    let view = TheaterCategoryReservationView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK:- Life Cycles
  // MARK: viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    setupMenuView()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    startAdAnimation()
  }
  
  // MARK:- Methods
  // MARK: startAdAnimation
  private func startAdAnimation() {
    let timer: Timer = Timer.scheduledTimer(
      timeInterval: 3,
      target: self,
      selector: #selector(adAnimation),
      userInfo: nil,
      repeats: true
    )
    timer.fire()
  }
  
  // MARK: adAnimation
  @objc private func adAnimation() {
    menuView.headerView.adCollectionView.scrollToItem(at: IndexPath(item: numPages, section: 0), at: .centeredHorizontally, animated: true)
    if numPages == 4 {
      numPages = 0
    } else {
      numPages += 1
    }
  }
  
  // MARK: setupMenuView
  private func setupMenuView() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(menuView)
    menuView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    menuView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    menuView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    menuView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}