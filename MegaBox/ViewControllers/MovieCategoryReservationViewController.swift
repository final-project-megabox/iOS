//
//  MovieCategoryReservationViewController.swift
//  MegaBox
//
//  Created by 차수연 on 06/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieCategoryReservationViewController: UIViewController {
  
  // MARK: - Properties
  
  var menuView = MenuView()
  
  var menuTitles = ["모든영화","큐레이션"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    menuView.menuTitles = menuTitles
    menuView.menuBar.menuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    
    view.addSubview(menuView)
    menuView.translatesAutoresizingMaskIntoConstraints = false
    menuView.menuBar.indicatorBar.widthAnchor.constraint(equalToConstant: self.view.frame.width / CGFloat(menuTitles.count)).isActive = true
    
    menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
  }
}

//extension MovieCategoryReservationViewController: MovieCategoryReservationViewDelegate {
//  func dismissButtonDidTapped() {
//    self.presentingViewController?.presentingViewController?.dismiss(animated: false)
//  }
//}
