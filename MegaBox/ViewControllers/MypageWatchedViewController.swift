//
//  MypageWatchedViewController.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MypageWatchedViewController: UIViewController {
  
  let topView: MyPageWatchedTopView = {
    let view = MyPageWatchedTopView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let contentView: MyPageWatchedContentView = {
    let view = MyPageWatchedContentView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    topView.delegate = self
    setupContentView()
  }
  
  func setupContentView() {
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


extension MypageWatchedViewController: MyPageWatchedTopViewDelegate {
  func touchUpDismissButton(sender: UIButton) {
    self.presentingViewController?.dismiss(animated: false, completion: nil)
  }
  
  
}
