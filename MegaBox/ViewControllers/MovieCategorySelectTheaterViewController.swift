//
//  MovieCategorySelectTheaterViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
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
    selectTheaterView.delegate = self
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

extension MovieCategorySelectTheatherViewController: MovieCategorySelectTheatherViewDelegate {
  //뒤로가기
  func touchUpDismissButton() {
    self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
    
  }
  
  //영화 선택
  func touchUpSelectMovieButton() {
    let movieCategoryVC = MovieCategoryReservationViewController()
    movieCategoryVC.dismissType = .one
    self.present(movieCategoryVC, animated: false)
  }
  
  //영화관 선택
  func touchUpSelectTheaterButton() {
    print("영화관 선택")
  }
  
  //날짜 선택
  func touchUpDateButton() {
    print("날짜 선택")
  }
  
  
}
