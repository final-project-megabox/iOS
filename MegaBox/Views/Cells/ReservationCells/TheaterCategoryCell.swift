//
//  TheaterCategoryCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryCell: UITableViewCell {
  static let identifier = "TheaterCategoryCell"
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let timeCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collecionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collecionView.register(TheaterCategoryCollectionCell.self, forCellWithReuseIdentifier: TheaterCategoryCollectionCell.identifier)
    collecionView.translatesAutoresizingMaskIntoConstraints = false
    collecionView.isPagingEnabled = false
    return collecionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    timeCollectionView.dataSource = self
    timeCollectionView.delegate = self
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    
  }

  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TheaterCategoryCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TheaterCategoryCollectionCell.identifier, for: indexPath) as! TheaterCategoryCollectionCell
    
    return cell
  }
}

extension TheaterCategoryCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (UIScreen.main.bounds.width - 20) / 4, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  }
}

