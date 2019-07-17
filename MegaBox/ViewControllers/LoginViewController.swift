//
//  LoginViewController.swift
//  MegaBox
//
//  Created by 차수연 on 16/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  let loginTopView = LoginView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    view.addSubview(loginTopView)
    loginTopView.translatesAutoresizingMaskIntoConstraints = false
    let guide = view.safeAreaLayoutGuide
    loginTopView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    loginTopView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    loginTopView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    loginTopView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.view.endEditing(true)
  }
}
