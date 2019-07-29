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
    collectionView.isPagingEnabled = true
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
      return CGSize(width: frame.width - 100, height: frame.height)
    } else {
      return CGSize(width: frame.width, height: frame.height)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
    print(proposedContentOffset)
    
    return CGPoint(x: 0, y: 0)
  }
}

extension NavigationDrawerView: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
    let layout = self.navigationDrawerCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
    
    
    // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
    // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
    var offset = targetContentOffset.pointee
    let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
    var roundedIndex = round(index)
    // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다. // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
    // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
    if scrollView.contentOffset.x > targetContentOffset.pointee.x { roundedIndex = floor(index)
    } else {
      roundedIndex = ceil(index)
      
    }
    // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
    offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
    targetContentOffset.pointee = offset
  }
}
