//
//  TheaterCategoryReservationHeaderView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryReservationHeaderView: UIView {
  
  
  var delegate: TheaterCategoryReservationHeaderViewDelegate?
  
  let adCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    collectionView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    collectionView.layer.borderWidth = 0.5
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  private let pageControl: UIPageControl = {
    let pageControl = UIPageControl()
    pageControl.hidesForSinglePage = true
    pageControl.numberOfPages = 5
    pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    return pageControl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    adCollectionView.dataSource = self
    adCollectionView.delegate = self
    
    adCollectionView.register(TheaterCategoryAdCollectionCell.self, forCellWithReuseIdentifier: TheaterCategoryAdCollectionCell.identifier)
    
    self.addSubview(adCollectionView)
    adCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    adCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    adCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    adCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 495) / 844).isActive = true
    
    self.addSubview(pageControl)
    pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    pageControl.centerYAnchor.constraint(equalTo: adCollectionView.centerYAnchor).isActive = true
    pageControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
    pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TheaterCategoryReservationHeaderView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TheaterCategoryAdCollectionCell.identifier, for: indexPath) as! TheaterCategoryAdCollectionCell
    if indexPath.row == 0 {
      cell.adImage.image = #imageLiteral(resourceName: "ad_movie_reservation1")
    } else if indexPath.row == 1 {
      cell.adImage.image = #imageLiteral(resourceName: "ad_movie_reservation2")
    } else if indexPath.row == 2 {
      cell.adImage.image = #imageLiteral(resourceName: "ad_movie_reservation3")
    } else if indexPath.row == 3 {
      cell.adImage.image = #imageLiteral(resourceName: "ad_movie_reservation4")
    } else if indexPath.row == 4 {
      cell.adImage.image = #imageLiteral(resourceName: "ad_movie_reservation5")
    }
    return cell
  }
}

extension TheaterCategoryReservationHeaderView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = (UIScreen.main.bounds.width * 495) / 844
    return CGSize(width: UIScreen.main.bounds.width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension TheaterCategoryReservationHeaderView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    self.pageControl.currentPage = indexPath.row
  }
}
