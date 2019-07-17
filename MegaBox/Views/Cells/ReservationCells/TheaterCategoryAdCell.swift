//
//  AdCell.swift
//  MegaBox
//
//  Created by Fury on 16/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryAdCell: UITableViewCell {
  
  static let identifier = "AdCell"
  
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
  
  let placeButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.2862745098, blue: 0.2901960784, alpha: 1)
    button.setTitle("동탄", for: .normal)
    button.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    button.setImage(#imageLiteral(resourceName: "main_moviebox_right_btn"), for: .normal)
    button.contentHorizontalAlignment = .left
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: (UIScreen.main.bounds.maxX / 2) - 40, bottom: 0, right: 0)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let dateButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.2862745098, blue: 0.2901960784, alpha: 1)
    button.setTitle("7월 17일(수)", for: .normal)
    button.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    button.setImage(#imageLiteral(resourceName: "main_moviebox_right_btn"), for: .normal)
    button.contentHorizontalAlignment = .left
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: (UIScreen.main.bounds.maxX / 2) - 40, bottom: 0, right: 0)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupProperties()
    
  }
  
  private func setupProperties() {
    adCollectionView.dataSource = self
    adCollectionView.delegate = self
    
    adCollectionView.register(TheaterCategoryAdCollectionCell.self, forCellWithReuseIdentifier: TheaterCategoryAdCollectionCell.identifier)
    
    contentView.addSubview(adCollectionView)
    adCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    adCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    adCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    adCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 495) / 844).isActive = true
    
    contentView.addSubview(pageControl)
    pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    pageControl.centerYAnchor.constraint(equalTo: adCollectionView.centerYAnchor).isActive = true
    pageControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
    pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    contentView.addSubview(placeButton)
    placeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    placeButton.leadingAnchor.constraint(equalTo: adCollectionView.leadingAnchor).isActive = true
    placeButton.bottomAnchor.constraint(equalTo: adCollectionView.bottomAnchor).isActive = true
    
    contentView.addSubview(dateButton)
    dateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    dateButton.leadingAnchor.constraint(equalTo: placeButton.trailingAnchor).isActive = true
    dateButton.trailingAnchor.constraint(equalTo: adCollectionView.trailingAnchor).isActive = true
    dateButton.bottomAnchor.constraint(equalTo: adCollectionView.bottomAnchor).isActive = true
    dateButton.widthAnchor.constraint(equalTo: placeButton.widthAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TheaterCategoryAdCell: UICollectionViewDataSource {
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

extension TheaterCategoryAdCell: UICollectionViewDelegateFlowLayout {
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

extension TheaterCategoryAdCell: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    self.pageControl.currentPage = indexPath.row
  }
  
  scrollview
}
