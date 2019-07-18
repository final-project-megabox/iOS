//
//  MovieCategorySelectTheatherViewController.swift
//  MegaBox
//
//  Created by 차수연 on 17/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieCategorySelectTheatherViewController: UIViewController {
  
  let selectTheaterView: MovieCategorySelectTheatherView = {
    let view = MovieCategorySelectTheatherView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      setupSelectTheaterView()
      
    }
  
  
  func setupSelectTheaterView() {
    view.addSubview(selectTheaterView)
    let guide = view.safeAreaLayoutGuide
    selectTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    selectTheaterView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    selectTheaterView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    selectTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
    
  }

}
