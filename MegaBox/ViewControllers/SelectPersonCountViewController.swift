//
//  SelectPersonCountViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectPersonCountViewController: UIViewController {
  
  let selectPersonCountView: SelectPersonCountView = {
    let view = SelectPersonCountView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3118311216)
    
//    selectPeopleCountView.delegate = self
    setupSelectPeopleCountView()
    
  }
  
  func setupSelectPeopleCountView() {
    view.addSubview(selectPersonCountView)
    
    let guide = view.safeAreaLayoutGuide
    selectPersonCountView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    selectPersonCountView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    selectPersonCountView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    selectPersonCountView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
  }
  
}

//extension SelectSeatViewController: SelectSeatViewDelegate {
//  func touchUpFinishButton(_ sender: UIButton) {
//    UIAlertController.show(title: "", message: "관람하실 인원을 선택해주세요.", from: self)
//  }
//
//  func touchUpPlusButton(_ sender: UIButton) {
//    UIAlertController.show(title: "", message: "인원선택은 총 8명까지 가능합니다", from: self)
//  }
//}
