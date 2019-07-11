//
//  ListCell.swift
//  MegaBox
//
//  Created by 차수연 on 10/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {
  static let identifier = "ListCell"
  
  let listTabelView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupListTableView()
  }
  
  private func setupListTableView() {
    listTabelView.dataSource = self
    listTabelView.delegate = self
    
    listTabelView.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.identifier)
    
    contentView.addSubview(listTabelView)
    
    listTabelView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    listTabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    listTabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    listTabelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  
}


extension ListCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = listTabelView.dequeueReusableCell(withIdentifier: MovieListCell.identifier, for: indexPath) as! MovieListCell
    return cell
  }
  
  
}


extension ListCell: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) as? MovieListCell else {return}
    cell.contentView.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7450980392, blue: 0.7843137255, alpha: 1)
    cell.movieTitleLabel.textColor = cell.isSelected ? .white : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    cell.movieSubTitleLabel.textColor = cell.isSelected ? .white : #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    cell.movieDurationLabel.text = cell.isSelected ? "" : "000분"
    cell.selectCheckImageView.isHidden = cell.isSelected ? false : true
    
    let menuBar = MenuBar()
    print(menuBar.movieTitleLabel)
    menuBar.movieTitleLabel.text = cell.movieTitleLabel.text
    print(menuBar.movieTitleLabel)
    menuBar.movieTitleLabel.textColor = cell.isSelected ? #colorLiteral(red: 0.3568627451, green: 0.7450980392, blue: 0.7843137255, alpha: 1) : .white
    
    menuBar.menuTitleSelectbutton.setTitleColor(#colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1), for: .normal)
    menuBar.menuTitleSelectbutton.layer.borderColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) as? MovieListCell else {return}
    cell.movieTitleLabel.textColor = cell.isSelected ? .white : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    cell.movieSubTitleLabel.textColor = cell.isSelected ? .white : #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    cell.movieDurationLabel.text = cell.isSelected ? "" : "000분"
    cell.selectCheckImageView.isHidden = cell.isSelected ? false : true
  }
}
