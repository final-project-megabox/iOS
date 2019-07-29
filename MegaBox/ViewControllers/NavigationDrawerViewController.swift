//
//  NavigationDrawerViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class NavigationDrawerViewController: UIViewController {
  
  private let navigationDrawerView: NavigationDrawerView = {
    let view = NavigationDrawerView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationDrawerView.delegate = self
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    setupNavigationDrawerView()
  }
  
  private func setupNavigationDrawerView() {
    view.addSubview(navigationDrawerView)
    let guide = view.safeAreaLayoutGuide
    
    navigationDrawerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    navigationDrawerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    navigationDrawerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    navigationDrawerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension NavigationDrawerViewController: NavigationDrawerViewDelegate {
  func touchUpLoginButton() {
    let loginPageVC = LoginViewController()
    
    self.present(loginPageVC, animated: false)
  }
}
