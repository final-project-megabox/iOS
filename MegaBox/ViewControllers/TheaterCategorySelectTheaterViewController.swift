//
//  SelectTheaterViewController.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

enum TheaterDismissType {
  case one
  case two
}

class TheaterCategorySelectTheaterViewController: UIViewController {
  private let shared = MovieDataManager.shared
  var dismissType: DismissType = .two
  private let urlStr: String = "http://megabox.hellocoding.shop//database/reservationFirstView/"
  
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
    switch dismissType {
    case .one:
      
      guard let selectedRegionName = selectTheaterView.movieTitleLabel.text else { return }
      NetworkService.getReservationData(urlStr, regionName: selectedRegionName, date: "2019-07-20") { result in
        switch result {
        case .success(let data):
          self.shared.reservationMovieData = data.sorted(by: { $0.movie < $1.movie })
          
          self.dismiss(animated: false)
        case .failure(let err):
          print(err.localizedDescription)
        }
      }
    case .two:
      let theaterCategoryReservationVC = TheaterCategoryReservationViewController()
      guard let selectedRegionName = selectTheaterView.movieTitleLabel.text else { return }
      theaterCategoryReservationVC.regionName = selectedRegionName
      
      NetworkService.getReservationData(urlStr, regionName: selectedRegionName, date: "2019-07-20") { result in
        switch result {
        case .success(let data):
          self.shared.reservationMovieData = data.sorted(by: { $0.movie < $1.movie })
          
          self.present(theaterCategoryReservationVC, animated: false)
        case .failure(let err):
          print(err.localizedDescription)
        }
      }
    }
  }
  
  func touchUpCancelButton() {
    switch dismissType {
    case .one:
      self.dismiss(animated: false)
    case .two:
      self.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
  }
}


