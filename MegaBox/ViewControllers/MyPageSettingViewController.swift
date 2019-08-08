//
//  MyPageSettingViewController.swift
//  MegaBox
//
//  Created by 차수연 on 02/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageSettingViewController: UIViewController {
  
  let topView: MyPageSettingTopView = {
    let view = MyPageSettingTopView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let contentView: MyPageSettingContentView = {
    let view = MyPageSettingContentView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    topView.delegate = self
    contentView.delegate = self
    settingView()
    getUserId()
  }
  
  func getUserId() {
    contentView.idLabel.text = "\(UserDefaults.standard.value(forKey: "UserId")!)"
  }
  
  func settingView() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(topView)
    topView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 41).isActive = true
    
    view.addSubview(contentView)
    contentView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    contentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
    
  }
  
}

extension MyPageSettingViewController: MyPageSettingTopViewDelegate {
  func touchUpMenuButton(_ sender: UIButton) {
    let naviDrawerVC = NavigationDrawerViewController()
    present(naviDrawerVC, animated: false)
  }
  
  func touchUpDismissButton(_ sender: UIButton) {
    self.presentingViewController?.dismiss(animated: false)
  }
  
  
}

extension MyPageSettingViewController: MyPageSettingContentViewDelegate {
  func touchUpLogoutButton(_ sender: UIButton) {
    
    UIAlertController.cancelShow(title: "", message: "로그아웃 하시겠습니까?", from: self) { (_) in
      UserDefaults.standard.removeObject(forKey: "Token")
      UserDefaults.standard.removeObject(forKey: "UserName")
      UserDefaults.standard.removeObject(forKey: "UserId")
      
      self.presentingViewController?.dismiss(animated: false)
    }
    
  }
  
  
}

