//
//  MyPagePreferTheaterViewController.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPagePreferTheaterViewController: UIViewController {
  
  let topView: MyPagePreferTheaterTopView = {
    let view = MyPagePreferTheaterTopView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let contentView: MyPagePreferTheaterView = {
    let view = MyPagePreferTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      
      topView.delegate = self
      setupPreferView()
        
    }
  
  func setupPreferView() {
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

extension MyPagePreferTheaterViewController: MyPagePreferTheaterTopViewDelegate {
  func touchUpDismissButton(sender: UIButton) {
    self.presentingViewController?.dismiss(animated: false, completion: nil)
  }
  
  
}


