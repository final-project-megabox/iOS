//
//  SelectSeatViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectSeatViewController: UIViewController {
  
  var movieData: ReservationData? = nil
  
  let eightTwoMovieTheaterView: EightTwoMovieTheaterView = {
    let view = EightTwoMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    setupEightTwoMovieTheaterView()
  }
  
  private func setupEightTwoMovieTheaterView() {
    let guide = view.safeAreaLayoutGuide
    let frontMargin: CGFloat = 100
    
    view.addSubview(eightTwoMovieTheaterView)
    eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor, constant: frontMargin).isActive = true
    eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
