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
  private var isFirst = true
  var isCancel = false
  
  private let shared = MovieDataManager.shared
  
  var numPages: Int = 0
  var regionName: String = ""
  
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
    
    menuView.delegate = self
    menuView.headerView.delegate = self
    
    
    setupMenuView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if isFirst {
      isFirst.toggle()
    } else {
      if !isCancel {
        menuView.calculateMoviesData()
        menuView.makeTableViewMovieData()
      }
    }

    startAdAnimation()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    menuView.headerView.placeButton.setTitle(regionName, for: .normal)
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

extension TheaterCategoryReservationViewController: TheaterCategoryReservationViewDelegate {
  func sendTitleData() {
    print("TheaterCategoryReservationViewController[96Line] - titleDelegate")
  }
  
  func sendMovieData(_ data: ReservationData) {
    let selectSeatVC = SelectSeatViewController()
    selectSeatVC.movieData = data
    self.present(selectSeatVC, animated: true)
  }
  
  func touchUpMovieTime() {
    let selectSeatVC = SelectSeatViewController()
    present(selectSeatVC, animated: true)
  }
  
  
  func touchUpMenuTitleDismissButton(_ sender: UIButton) {
    self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
}

extension TheaterCategoryReservationViewController: TheaterCategoryReservationHeaderViewDelegate {
  
  func touchUpPlaceButton() {
    let theaterCategorySelectTheaterVC = TheaterCategorySelectTheaterViewController()
    theaterCategorySelectTheaterVC.dismissType = .one
    self.present(theaterCategorySelectTheaterVC, animated: false)
  }
  
  func touchUpDateButton() {
    
  }
}
