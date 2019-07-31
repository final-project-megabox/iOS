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
    label.text = "2관 총 103석 | 디지털"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let timeCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collecionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collecionView.isScrollEnabled = false
    collecionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    collecionView.register(TheaterCategoryCollectionCell.self, forCellWithReuseIdentifier: TheaterCategoryCollectionCell.identifier)
    collecionView.translatesAutoresizingMaskIntoConstraints = false
    return collecionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    timeCollectionView.dataSource = self
    timeCollectionView.delegate = self
    
    setupProperties()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  //
  //
  //
  // 영화 이름, 관 정보 받아서 데이터 모델이서 타임을 가져와 컬렉션에 뿌릴 것
  func cellConfigure(_ title: String) {
    self.titleLabel.text = title
  }
  
  private func setupProperties() {
    let margin: CGFloat = 10
    contentView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin / 2).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    contentView.addSubview(timeCollectionView)
    timeCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin).isActive = true
    timeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    timeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    timeCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    timeCollectionView.heightAnchor.constraint(equalToConstant: 190).isActive = true
    
  }

  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TheaterCategoryCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TheaterCategoryCollectionCell.identifier, for: indexPath) as! TheaterCategoryCollectionCell
    
    return cell
  }
}

extension TheaterCategoryCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.width - 20) / 4.2, height: 70)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}

