//
//  LoginViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  let loginView: LoginView = {
    let view = LoginView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loginView.delegate = self
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    setupLoginView()
  }
  
  private func setupLoginView() {
    view.addSubview(loginView)
    
    let guide = view.safeAreaLayoutGuide
    loginView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    loginView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    loginView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    loginView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.view.endEditing(true)
  }
}

extension LoginViewController: LoginViewDelegate {
  func touchUpLoginButton() {
    let myPageVC = MyPageViewController()
    present(myPageVC, animated: false)
  }
  
  func touchUpSelectDismissButton() {
    self.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  
}
