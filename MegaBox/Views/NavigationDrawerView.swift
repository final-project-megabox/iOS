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
  let shared = UserDataManager.shared
  
  let now = Date()
  
  var lastContentOffset: CGFloat = 0.0
  
  let navigationDrawerCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
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
  
  @objc func touchUpSettingButton(_ sender: UIButton) {
    delegate?.touchUpSettingButton()
  }

  @objc func touchUpUserNameButton(_ sender: UIButton) {
    delegate?.touchUpUserNameButton()
  }
  
  @objc func touchUpDismissButton(_ sender: UIButton) {
    delegate?.touchUpDismissButton()
  }
  
  @objc func touchUpLoginButton(_ sender: UIButton) {
    delegate?.touchUpLoginButton()
  }
  
  private func setupCollectionView() {
    navigationDrawerCollectionView.dataSource = self
    navigationDrawerCollectionView.delegate = self
    navigationDrawerCollectionView.register(NavigationDrawerCell.self, forCellWithReuseIdentifier: NavigationDrawerCell.identifier)
    navigationDrawerCollectionView.register(NavigationDrawerAdCell.self, forCellWithReuseIdentifier: NavigationDrawerAdCell.identifier)
    //로그인 되었을때
    navigationDrawerCollectionView.register(isLoginNavigationDrawerCell.self, forCellWithReuseIdentifier: isLoginNavigationDrawerCell.identifier)
    
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
    return 7
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.row == 0 {
      
      //로그인 되었을때
      if UserDefaults.standard.value(forKeyPath: "Token") != nil {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: isLoginNavigationDrawerCell.identifier, for: indexPath) as! isLoginNavigationDrawerCell
        //마이페이지로 이동
        cell.userNameButton.addTarget(self, action: #selector(touchUpUserNameButton(_:)), for: .touchUpInside)
        //환경설정으로 이동
        cell.naviDrawerSettingButton.addTarget(self, action: #selector(touchUpSettingButton(_:)), for: .touchUpInside)
        cell.naviDrawerCancelButton.addTarget(self, action: #selector(touchUpDismissButton(_:)), for: .touchUpInside)
        
        guard let userName = UserDefaults.standard.value(forKey: "UserName") else { return cell }
        cell.userNameButton.setTitle("\(userName)", for: .normal)
        
        cell.lastLoginLabel.text = "마지막 로그인 \(shared.myPageData!.lastLogin)"
        return cell
        
      } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NavigationDrawerCell.identifier, for: indexPath) as! NavigationDrawerCell
        cell.loginButton.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
        cell.naviDrawerCancelButton.addTarget(self, action: #selector(touchUpDismissButton(_:)), for: .touchUpInside)
  
        return cell
      }
      
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NavigationDrawerAdCell.identifier, for: indexPath) as! NavigationDrawerAdCell
      cell.bgImageView.image = UIImage(named: "ad_slid_\(indexPath.row)")
      cell.adImageView.image = UIImage(named: "ad_slid_\(indexPath.row)")
      return cell
    }
  }
}

extension NavigationDrawerView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.row == 0 {
      return CGSize(width: (frame.width / 4) * 3, height: frame.height)
    } else {
      return CGSize(width: frame.width - 80, height: frame.height)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}

extension NavigationDrawerView: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    print(scrollView.bounds.maxX)
    if scrollView.bounds.maxX == 375 {
      
    }
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print(scrollView.contentOffset.x)

    self.lastContentOffset = scrollView.contentOffset.x
    
    if self.lastContentOffset <= 0 {
      scrollView.contentOffset.x = 0
    } else {
      scrollView.contentOffset.x = lastContentOffset
    }
  }
}


