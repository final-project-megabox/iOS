//
//  LoginViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  private let shared = MovieDataManager.shared
  private let userShared = UserDataManager.shared
  private let movieReservationURLStr = "http://megabox.hellocoding.shop//database/showMovies/"
  
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
  func touchUpLoginButton(id: String, pw: String) {
    
    if id.isEmpty {
      UIAlertController.show(title: "", message: "아이디를 입력해주세요.", from: self)
    }else if pw.isEmpty {
      UIAlertController.show(title: "", message: "비밀번호를 입력해주세요.", from: self)
    }else {
      
      NetworkService.getToken(email: id, pw: pw) { (result) in
        switch result {
        case .success(let value):
          print("token: ", value.token)
          print("userName: ", value.name)
          print("userId: ", value.user)
          let token = value.token
          let userName = value.name
          let userId = value.user
          
          
          //로그인후 토큰, 이름, 아이디 UserDefaults에 저장
          UserDefaults.standard.setValue(token, forKey: "Token")
          UserDefaults.standard.setValue(userName, forKey: "UserName")
          UserDefaults.standard.setValue(userId, forKey: "UserId")
          
          //사용자의 isWhised를 가져오기 위함
          NetworkService.getAllMovieData(self.movieReservationURLStr) { result in
            switch result {
            case .success(let data):
              self.shared.allMovieData = data
            case .failure(let err):
              print("[Log2]: fail ", err)
            }
          }
          
          
          //UserDefaults에 저장후 dismiss
          self.presentingViewController?.dismiss(animated: false)
        case .failure(let err):
          print("result: ", err)
          DispatchQueue.main.async {
            UIAlertController.show(title: "", message: "아이디와 비밀번호를 확인해주세요.", from: self)
          }
          
        }
      }
      
    }
    
    
    
    
  }
  
  func touchUpSelectDismissButton() {
    self.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  func touchUpRegisterButton() {
    UIAlertController.show(title: "", message: "m.megabox.co.kr에서\n회원가입이 가능합니다.", from: self)
  }
  
}
