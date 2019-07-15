//
//  ViewController.swift
//  MegaBox
//
//  Created by Fury on 04/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private let mainTopView = MainTopView()
  private let mainTableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    mainTableView.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
    mainTableView.showsVerticalScrollIndicator = false
    mainTableView.separatorColor = UIColor.clear
    mainTableView.allowsSelection = false
    
    mainTableView.dataSource = self
    mainTableView.delegate = self
    mainTopView.delegate = self
    
    self.mainTableView.register(MainTopMediaPlayCell.self, forCellReuseIdentifier: MainTopMediaPlayCell.identifier)
    self.mainTableView.register(MainMovieReservationCell.self, forCellReuseIdentifier: MainMovieReservationCell.identifier)
    self.mainTableView.register(MainShortMenuCell.self, forCellReuseIdentifier: MainShortMenuCell.identifier)
    self.mainTableView.register(MainAdCell.self, forCellReuseIdentifier: MainAdCell.identifier)
    self.mainTableView.register(MainMovieBoxCell.self, forCellReuseIdentifier: MainMovieBoxCell.identifier)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setupMainTopView()
  }
  
  
  
  private func setupMainTopView() {
    mainTopView.translatesAutoresizingMaskIntoConstraints = false
    mainTableView.translatesAutoresizingMaskIntoConstraints = false

    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(mainTableView)
    mainTableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    mainTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    mainTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    mainTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
    mainTableView.addSubview(mainTopView)
    mainTopView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    mainTopView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    mainTopView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    mainTopView.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
}

// MARK:- 수정이 필요한 사항
// 뷰 띄우는 행위 컨트롤러로 이동기킬 것
extension MainViewController: MainTopViewDelegate {
  func openNavigationDrawerView() {
    let navigationDrawerVC = NavigationDrawerViewController()
    self.present(navigationDrawerVC, animated: false)
  }
  
  func openQuickReservationView() {
    let quickReservationVC = QuickReservationViewController()
    quickReservationVC.modalPresentationStyle = .overCurrentContext
    self.present(quickReservationVC, animated: false)
  }
}

extension MainViewController: MainMovieReservationCellDelegate {
  func touchUpOwlStageButton(_ sender: UIButton, _ width: NSLayoutConstraint, _ leading: NSLayoutConstraint) {
    
  }
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MainTopMediaPlayCell.identifier) as! MainTopMediaPlayCell
    
    if indexPath.row == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieReservationCell.identifier) as! MainMovieReservationCell
      // Owl Stage Button Click Delegate
      cell.delegate = self
      return cell
    } else if indexPath.row == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainShortMenuCell.identifier) as! MainShortMenuCell
      return cell
    } else if indexPath.row == 3 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainAdCell.identifier) as! MainAdCell
      guard let adImageNum: Int = (0...1).randomElement() else { return cell }
      let adImageArr: [UIImage] = [#imageLiteral(resourceName: "ad1"), #imageLiteral(resourceName: "ad2")]
      if adImageNum == 0 {
        cell.guideBGView.backgroundColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
      } else {
        cell.guideBGView.backgroundColor = #colorLiteral(red: 0.01960784314, green: 0.2745098039, blue: 0.8431372549, alpha: 1)
      }
      cell.adImage.image = adImageArr[adImageNum]
      return cell
    } else if indexPath.row == 4 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieReservationCell.identifier) as! MainMovieReservationCell
      return cell
    } else if indexPath.row == 5 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieBoxCell.identifier) as! MainMovieBoxCell
      return cell
    } else if indexPath.row == 6 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainAdCell.identifier) as! MainAdCell
      cell.adImage.image = #imageLiteral(resourceName: "second_ad")
      return cell
    }
    
    return cell
  }
}

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return (UIScreen.main.bounds.width * 907) / 1080
    } else if indexPath.row == 1 {
      return 430
    } else if indexPath.row == 2 {
      return 90
    } else if indexPath.row == 3 {
      return 90
    } else if indexPath.row == 4 {
      return 400
    } else if indexPath.row == 5 {
      return 250
    } else if indexPath.row == 6 {
      return 90
    }
    return 80
  }
}
