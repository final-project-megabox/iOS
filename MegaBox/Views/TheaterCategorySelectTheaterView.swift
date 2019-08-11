//
//  SelectTheaterView.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterView: UIView {
  
  var delegate: TheaterCategorySelectTheaterViewDelegate?
  
  var regionData: [String]?
  var regionTheaterData: [String]?
  
  private var regionDataColor: [UIColor] = []
  private var regionTheaterDataColor: [String: [UIColor]] = [:]
  
  private let allRegionData = AllRegionData()
  lazy var regionNames: [String] = allRegionData.regionNames
  
  private var selectedRegionNumber: Int = 0
  
  // 영화관이 선택된 지역과 영화관 정보
  private var selectedRegion: String = ""
  private var selectedTheater: String = ""
  
  private let menuTitleView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let menuTitleDismissButton: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(touchUpDismissButton), for: .touchUpInside)
    button.setImage(#imageLiteral(resourceName: "purpleCancel_icon"), for: .normal)
    button.tintColor = UIColor.appColor(.megaBoxColor)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let menuTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관 선택"
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let menuTitleSelectbutton: UIButton = {
    let button = UIButton()
    button.setTitle("선택완료", for: .normal)
    button.addTarget(self, action: #selector(touchUpmenuTitleSelectbutton(_:)), for: .touchUpInside)
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    button.setTitleColor(UIColor.appColor(.defaultGrayColor), for: .normal)
    button.layer.borderColor = UIColor.appColor(.defaultGrayColor).cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    button.isEnabled = false
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "원하는 영화관을 선택해주세요."
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.backgroundColor = UIColor.appColor(.darkBgColor)
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
  
  let regionTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TheaterCategorySelectTheaterRegionCell.self, forCellReuseIdentifier: TheaterCategorySelectTheaterRegionCell.identifier)
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  let regionListTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TheaterCategorySelectTheaterEmptyCell.self, forCellReuseIdentifier: TheaterCategorySelectTheaterEmptyCell.identifier)
    tableView.register(TheaterCategorySelectTheaterRegionListCell.self, forCellReuseIdentifier: TheaterCategorySelectTheaterRegionListCell.identifier)
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
    setupProperties()
    
    regionTableView.dataSource = self
    regionTableView.delegate = self
    regionListTableView.dataSource = self
    regionListTableView.delegate = self
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    makeTableCellColor()
    
    regionButton.touchUpButton(isTouched: true, width: regionButton.frame.width)
    regionListButton.touchUpButton(isTouched: false, width: regionListButton.frame.width)
  }
  
  private func makeTableCellColor() {
    guard let regionList = regionData else { return }
    guard let theaterList = regionTheaterData else { return }
    
    for region in regionNames {
      if regionList.contains(region) {
        regionDataColor.append(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
      } else {
        regionDataColor.append(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
      }
    }
    
    for region in regionNames {
      for theater in allRegionData.region[region]! {
        if theaterList.contains(theater) {
          if regionTheaterDataColor[region] == nil {
            regionTheaterDataColor[region] = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
          } else {
            regionTheaterDataColor[region]?.append(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
          }
        } else {
          if regionTheaterDataColor[region] == nil {
            regionTheaterDataColor[region] = [#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)]
          } else {
            regionTheaterDataColor[region]?.append(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
          }
        }
      }
    }
    
    regionDataColor[0] = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
  }
  
  @objc private func touchUpmenuTitleSelectbutton(_ sender: UIButton) {
    delegate?.touchUpmenuTitleSelectbutton()
  }
  
  @objc private func touchUpDismissButton(_ sender: UIButton) {
    delegate?.touchUpCancelButton()
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
    regionTableView.layer.borderColor = UIColor.appColor(.defaultGrayColor).cgColor
    regionTableView.layer.borderWidth = 1
    regionTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
    
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
}

extension TheaterCategorySelectTheaterView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableView.backgroundView = nil
    if tableView == regionTableView {
      return regionNames.count
    } else {
      if selectedRegionNumber == 0 {
        return 1
      } else {
        guard let count = allRegionData.region[regionNames[selectedRegionNumber]]?.count else { return 0 }
        return count
      }
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let regionTableViewBgColorView = UIView()
    let regionListTableViewBgColorView = UIView()
    regionTableViewBgColorView.backgroundColor = UIColor.appColor(.selectedCellGrayColor)
    regionListTableViewBgColorView.backgroundColor = UIColor.appColor(.selectedCellMintColor)
    
    
    let regionName = regionNames[selectedRegionNumber]
    
    if tableView == regionTableView {
      let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategorySelectTheaterRegionCell.identifier, for: indexPath) as! TheaterCategorySelectTheaterRegionCell
      cell.isUserInteractionEnabled = true
      cell.selectedBackgroundView = regionTableViewBgColorView
      cell.regionName.text = regionNames[indexPath.row]
      
      if indexPath.row == 0 {
        cell.regionName.textColor = regionDataColor[indexPath.row]
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
      } else {
        guard let regionList = regionData else { return cell }
        if regionList.contains(regionNames[indexPath.row]) {
          cell.regionName.textColor = regionDataColor[indexPath.row]
        } else {
          cell.isUserInteractionEnabled = false
        }
      }
      return cell
    } else {
      if selectedRegionNumber == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategorySelectTheaterEmptyCell.identifier, for: indexPath) as! TheaterCategorySelectTheaterEmptyCell
        cell.selectedBackgroundView = regionTableViewBgColorView
        
        return cell
      } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategorySelectTheaterRegionListCell.identifier, for: indexPath) as! TheaterCategorySelectTheaterRegionListCell
        cell.selectedBackgroundView = regionListTableViewBgColorView
        cell.regionListName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        cell.isUserInteractionEnabled = true
        let theaterName = allRegionData.region[regionNames[selectedRegionNumber]]?[indexPath.row]
        cell.regionListName.text = theaterName

        guard let regionTheaterList = regionTheaterData else { return cell }
        if regionTheaterList.contains(theaterName!) {
          cell.regionListName.textColor = regionTheaterDataColor[regionName]![indexPath.row]
        } else {
          cell.isUserInteractionEnabled = false
        }
        
        if cell.regionListName.text == selectedTheater {
          tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
          cell.regionListName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        return cell
      }
    }
  }
}

extension TheaterCategorySelectTheaterView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if tableView == regionTableView {
      return 40
    } else {
      if selectedRegionNumber == 0 {
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        return tableView.frame.height
      } else {
        tableView.isScrollEnabled = true
        tableView.allowsSelection = true
        return 40
      }
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == regionTableView {
      selectedRegionNumber = indexPath.row
      let cell = tableView.cellForRow(at: indexPath) as! TheaterCategorySelectTheaterRegionCell
      selectedRegion = cell.regionName.text ?? ""
      regionListTableView.reloadData()
    } else {
      let cell = tableView.cellForRow(at: indexPath) as! TheaterCategorySelectTheaterRegionListCell
      cell.regionListName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      let theater = allRegionData.region[regionNames[selectedRegionNumber]]?[indexPath.row]
      movieTitleLabel.text = theater
      selectedTheater = theater ?? ""
      movieTitleLabel.textColor = UIColor.appColor(.selectedCellMintColor)
      menuTitleSelectbutton.setTitleColor(UIColor.appColor(.megaBoxColor), for: .normal)
      menuTitleSelectbutton.layer.borderColor = UIColor.appColor(.megaBoxColor).cgColor
      menuTitleSelectbutton.isEnabled = true
    }
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    if tableView == regionTableView {
      
    } else {
      let cell = tableView.cellForRow(at: indexPath) as! TheaterCategorySelectTheaterRegionListCell
      cell.regionListName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
  }
}
