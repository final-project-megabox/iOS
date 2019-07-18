//
//  NavigationDrawerView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class NavigationDrawerView: UIView {
  
  var delegate: NavigationDrawerViewDelegate?
  
  let navigationDrawerCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupCollectionView()
  }
  
  @objc func touchUpLoginButton(_ sender: UIButton) {
    delegate?.touchUpLoginButton()
  }
  
  private func setupCollectionView() {
    navigationDrawerCollectionView.dataSource = self
    navigationDrawerCollectionView.delegate = self
    navigationDrawerCollectionView.register(NavigationDrawerCell.self, forCellWithReuseIdentifier: NavigationDrawerCell.identifier)
    navigationDrawerCollectionView.register(NavigationDrawerAdCell.self, forCellWithReuseIdentifier: NavigationDrawerAdCell.identifier)
    
    self.addSubview(navigationDrawerCollectionView)
    
    navigationDrawerCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    navigationDrawerCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    navigationDrawerCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    navigationDrawerCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension NavigationDrawerView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.row == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NavigationDrawerCell.identifier, for: indexPath) as! NavigationDrawerCell
      cell.loginButton.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NavigationDrawerAdCell.identifier, for: indexPath) as! NavigationDrawerAdCell
      return cell
    }
  }
}

extension NavigationDrawerView: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.row == 0 {
      return CGSize(width: frame.width, height: frame.height)
    } else {
      return CGSize(width: frame.width - 80, height: frame.height / 2)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
