//
//  MenuBar.swift
//  MegaBox
//
//  Created by 차수연 on 10/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MenuBar: UIView {
  
  // MARK: - Properties
  
  private let menuTitleView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let menuTitleDismissButton: UIButton = {
    let button = UIButton(type: .custom)
    button.backgroundColor = .purple
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let menuTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화 선택"
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let menuTitleSelectbutton: UIButton = {
    let button = UIButton()
    button.setTitle("선택완료", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
    button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "보고싶은 하나의 영화를 선택해주세요."
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let menuCollectionView: UICollectionView = {
    // flow layout
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    
    // collection view
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    // not show scroll indicator
    collectionView.showsHorizontalScrollIndicator = false
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
    return collectionView
  }()
  
  let indicatorBar: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    return view
  }()
  
  var menuTitles = [String]()
  var indicatorBarLeadingConstraint: NSLayoutConstraint!
  
  var delegate: MenuBarDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureCollectionView()
    autolayout()
  }
  
  private func configureCollectionView(){
    
    menuCollectionView.dataSource = self
    menuCollectionView.delegate = self
    
    menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
  }
  
  private func autolayout(){
    addSubview(menuTitleView)
    addSubview(movieTitleLabel)
    addSubview(menuTitleDismissButton)
    addSubview(menuTitleLabel)
    addSubview(menuTitleSelectbutton)
    
    addSubview(menuCollectionView)
    addSubview(indicatorBar)
    
    let margin: CGFloat = 15
    
    menuTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    menuTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    menuTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    menuTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    movieTitleLabel.topAnchor.constraint(equalTo: menuTitleView.bottomAnchor).isActive = true
    movieTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    movieTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    movieTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    menuTitleDismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
    menuTitleDismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    menuTitleDismissButton.centerYAnchor.constraint(equalTo: menuTitleLabel.centerYAnchor).isActive = true
    
    menuTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
    menuTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    menuTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    menuTitleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    
    menuTitleSelectbutton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.5).isActive = true
    menuTitleSelectbutton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
    menuTitleSelectbutton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    menuCollectionView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
    menuCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    menuCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    menuCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    indicatorBarLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: leadingAnchor)
    indicatorBarLeadingConstraint.isActive = true
    
    indicatorBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
    indicatorBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



extension MenuBar: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuTitles.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
    cell.label.text = menuTitles[indexPath.row]
    return cell
  }
  
  
}

extension MenuBar: UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    delegate?.meunBarDidSelected(indexPath)
    
    indicatorBarLeadingConstraint.constant = (self.frame.width / CGFloat(menuTitles.count)) * CGFloat((indexPath.item))
    
    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      self.layoutIfNeeded()
    }, completion: nil)
    
  }
  
}

extension MenuBar: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.frame.width / CGFloat(menuTitles.count), height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
