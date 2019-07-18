//
//  SelectPersonCountViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectPersonCountViewController: UIViewController {
  
  private let selectPersonCountView: SelectPersonCountView = {
    let view = SelectPersonCountView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupSelectPersonCountView()
  }
  
  private func setupSelectPersonCountView() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(selectPersonCountView)
    selectPersonCountView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    selectPersonCountView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    selectPersonCountView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    selectPersonCountView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}
