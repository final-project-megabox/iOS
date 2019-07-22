//
//  SelectTheaterView.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterView: UIView {
  
  private var sectionTitles = ["지역별", "특별관"]
  
  private let regionData = RegionData()
  lazy var regionNames: [String] = regionData.regionNames
  
  private let menuTitleView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let menuTitleDismissButton: UIButton = {
    let button = UIButton(type: .custom)
    //    button.addTarget(self, action: #selector(dismissButtonDidTpaaed), for: .touchUpInside)
    button.setImage(#imageLiteral(resourceName: "purpleCancel_icon"), for: .normal)
    button.tintColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let menuTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관 선택"
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let menuTitleSelectbutton: UIButton = {
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
  
  private let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "원하는 영화관을 선택해주세요."
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let regionButton: UIButton = {
    let button = UIButton()
    button.setTitle("지역별", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let regionListButton: UIButton = {
    let button = UIButton()
    button.setTitle("특별관", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let regionTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TheaterCategorySelectTheaterRegionCell.self, forCellReuseIdentifier: TheaterCategorySelectTheaterRegionCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  private let regionListTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TheaterCategorySelectTheaterEmptyCell.self, forCellReuseIdentifier: TheaterCategorySelectTheaterEmptyCell.identifier)
    tableView.register(TheaterCategorySelectTheaterRegionListCell.self, forCellReuseIdentifier: TheaterCategorySelectTheaterRegionListCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    regionTableView.dataSource = self
    regionListTableView.dataSource = self
    regionTableView.delegate = self
    regionListTableView.delegate = self
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProperties()
  }
  
  private func setupProperties() {
    let margin: CGFloat = 15
    self.addSubview(menuTitleView)
    menuTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    menuTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    menuTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    menuTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    menuTitleView.addSubview(menuTitleLabel)
    menuTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
    menuTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    menuTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    menuTitleView.addSubview(menuTitleDismissButton)
    menuTitleDismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
    menuTitleDismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    menuTitleDismissButton.centerYAnchor.constraint(equalTo: menuTitleLabel.centerYAnchor).isActive = true
    
    menuTitleView.addSubview(menuTitleSelectbutton)
    menuTitleSelectbutton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.5).isActive = true
    menuTitleSelectbutton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
    menuTitleSelectbutton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    menuTitleSelectbutton.centerYAnchor.constraint(equalTo: menuTitleLabel.centerYAnchor).isActive = true
    
    self.addSubview(movieTitleLabel)
    movieTitleLabel.topAnchor.constraint(equalTo: menuTitleView.bottomAnchor).isActive = true
    movieTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    movieTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    movieTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    movieTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    self.addSubview(regionButton)
    regionButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
    regionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    regionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    self.addSubview(regionListButton)
    regionListButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
    regionListButton.leadingAnchor.constraint(equalTo: regionButton.trailingAnchor).isActive = true
    regionListButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    regionListButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    regionListButton.widthAnchor.constraint(equalTo: regionButton.widthAnchor, multiplier: 1.7).isActive = true
    
    self.addSubview(regionTableView)
    regionTableView.topAnchor.constraint(equalTo: regionButton.bottomAnchor).isActive = true
    regionTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    regionTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    regionTableView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    regionTableView.layer.borderWidth = 1
    
    self.addSubview(regionListTableView)
    regionListTableView.topAnchor.constraint(equalTo: regionListButton.bottomAnchor).isActive = true
    regionListTableView.leadingAnchor.constraint(equalTo: regionTableView.trailingAnchor).isActive = true
    regionListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    regionListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    regionListTableView.widthAnchor.constraint(equalTo: regionTableView.widthAnchor, multiplier: 1.7).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    regionButton.touchUpButton(isTouched: true, width: regionButton.frame.width)
    regionListButton.touchUpButton(isTouched: false, width: regionListButton.frame.width)
  }
}

extension TheaterCategorySelectTheaterView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == regionTableView {
      return regionNames.count
    } else {
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let bgColorView = UIView()
    bgColorView.backgroundColor = #colorLiteral(red: 0.9384746552, green: 0.9328956604, blue: 0.9427630305, alpha: 1)
    if tableView == regionTableView {
      let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategorySelectTheaterRegionCell.identifier, for: indexPath) as! TheaterCategorySelectTheaterRegionCell
      cell.selectedBackgroundView = bgColorView
      cell.regionName.text = regionNames[indexPath.row]
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategorySelectTheaterEmptyCell.identifier, for: indexPath) as! TheaterCategorySelectTheaterEmptyCell
      cell.selectedBackgroundView = bgColorView
      return cell
    }
  }
}

extension TheaterCategorySelectTheaterView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if tableView == regionTableView {
      return 40
    } else {
      if indexPath.row == 0 {
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        return tableView.frame.height
      } else {
        return 40
      }
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == regionTableView {
      
    } else {
      
    }
  }
}
