//
//  ViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK:- Properties
  private let shared = MovieDataManager.shared
  private let userShared = UserDataManager.shared
  private var isTop: Bool = true
  
  var mainPosterImageData: Data?
  var mainPosterTitleStr: String?
  var mainPosterSubTitleStr: String?
  
  var eventImageData: Data?
  var eventTitleStr: String?
  var eventSubTitleStr: String?
  
  var allMovieData: [MovieData]?
  
  var cellHeightDictionary: NSMutableDictionary = [:]
  
  private let mainTopView = MainTopView()
  
  let mainRefreshControl = UIRefreshControl()
  
  private let mainTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(MainTopMediaPlayCell.self, forCellReuseIdentifier: MainTopMediaPlayCell.identifier)
    tableView.register(MainMovieReservationCell.self, forCellReuseIdentifier: MainMovieReservationCell.identifier)
    tableView.register(MainShortMenuCell.self, forCellReuseIdentifier: MainShortMenuCell.identifier)
    tableView.register(MainAdCell.self, forCellReuseIdentifier: MainAdCell.identifier)
    tableView.register(MainEventCell.self, forCellReuseIdentifier: MainEventCell.identifier)
    tableView.register(MainMovieBoxCell.self, forCellReuseIdentifier: MainMovieBoxCell.identifier)
    tableView.register(MainMoviePostCell.self, forCellReuseIdentifier: MainMoviePostCell.identifier)
    tableView.register(MainBranchNewsCell.self, forCellReuseIdentifier: MainBranchNewsCell.identifier)
    tableView.register(MainNotificationCell.self, forCellReuseIdentifier: MainNotificationCell.identifier)
    tableView.register(MainFooterCell.self, forCellReuseIdentifier: MainFooterCell.identifier)
    tableView.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8352941176, blue: 0.862745098, alpha: 1)
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorColor = UIColor.clear
    return tableView
  }()
  
  // MARK:- Life Cycles
  // MARK: viewDidLoad()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    self.mainTableView.dataSource = self
    self.mainTableView.delegate = self
    self.mainTopView.delegate = self
  }
  
  // MARK: viewDidLayoutSubviews()
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setupMainTopView()
    initRefresh()
  }
  
  // MARK:- Methods
  // MARK: initRefresh()
  private func initRefresh() {
    mainRefreshControl.addTarget(self, action: #selector(pullRefreshTableView), for: .valueChanged)
    
    if #available(iOS 10.0, *) {
      mainTableView.refreshControl = mainRefreshControl
    } else {
      mainTableView.addSubview(mainRefreshControl)
    }
  }
  
  // MARK: pullRefreshTableView()
  @objc private func pullRefreshTableView() {
    mainRefreshControl.endRefreshing()
    getNewMainData()
    mainTableView.reloadData()
  }
  
  private func getNewMainData() {
    let boxOfficeMovieDataUrl = ApiUrlData.ApiUrl(.boxOfficeMovieDataApi)
    
    NetworkService.getAllMovieData(boxOfficeMovieDataUrl) { result in
      switch result {
      case .success(let data):
        self.shared.allMovieData = data
        self.shared.sortedAllMovieTitle = data.map({ $0.title })
        
        let moviePosterData = ApiUrlData.ApiUrl(.movieMainPosterApi).split(separator: "|")
        let moviePosterUrl = String(moviePosterData[0])
        let moviePosterTitle = String(moviePosterData[1])
        let moviePosterSubTitle = String(moviePosterData[2])
        
        let eventData = ApiUrlData.ApiUrl(.eventApi).split(separator: "|")
        let eventDataUrl = String(eventData[0])
        let eventDataTitle = String(eventData[1])
        let eventDataSubTitle = String(eventData[2])
        
        let moviePosterURL = URL(string: moviePosterUrl)!
        let eventDataURL = URL(string: eventDataUrl)!
        
        do {
          let moviePosterData = try Data(contentsOf: moviePosterURL)
          self.allMovieData = data
          self.mainPosterImageData = moviePosterData
          self.mainPosterTitleStr = moviePosterTitle
          self.mainPosterSubTitleStr = moviePosterSubTitle
        } catch {
          print("[Error Log] :", error.localizedDescription)
        }
        
        do {
          let eventData = try Data(contentsOf: eventDataURL)
          self.eventImageData = eventData
          self.eventTitleStr = eventDataTitle
          self.eventSubTitleStr = eventDataSubTitle
        } catch {
          print("[Error Log] :", error.localizedDescription)
        }
      case .failure(let err):
        print(err)
      }
    }
  }
  
  // MARK: setupMainTopView()
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

// MARK:- Extension
// MARK: MainTopViewDelegate
extension MainViewController: MainTopViewDelegate {
  func openNavigationDrawerView() {
    let navigationDrawerVC = NavigationDrawerViewController()
    
    if UserDefaults.standard.value(forKey: "Token") != nil { //로그인 되어있을때
      //사용자의 myPage를 가져오기 위함
      let url = ApiUrlData.ApiUrl(.myPageApi)
      
      NetworkService.getUserMyPageData(url) { (result) in
        switch result {
        case .success(let value):
          self.userShared.myPageData = value
          print("[Log]", value)
          self.present(navigationDrawerVC, animated: false)
        case .failure(let err):
          print("result: ", err)
        }
      }
    } else {
      self.present(navigationDrawerVC, animated: false)
    }
    
    
  }
  
  func openQuickReservationView() {
    let quickReservationVC = QuickReservationViewController()
    quickReservationVC.modalPresentationStyle = .overCurrentContext
    self.present(quickReservationVC, animated: false)
  }
}

// MARK: MainMovieReservationCellDelegate
extension MainViewController: MainMovieReservationCellDelegate {
  func touchUpReservationOwlStageButton(_ sender: UIButton, _ trailing: NSLayoutConstraint, _ leading: NSLayoutConstraint, _ stackViewWidth: CGFloat) {
    // +-20은 StackView의 Spacing
    leading.constant = sender.frame.minX + 20
    trailing.constant = -(stackViewWidth - sender.frame.maxX - 20)
    
    let url = ApiUrlData.ApiUrl(.boxOfficeMovieDataApi)
    
    guard let title = sender.currentTitle else { return }
    
    if title == "상영예정" {
      NetworkService.getAllMovieData(url) { (response) in
        switch response {
        case .success(let data):
          let currentDateStr = Date().geCurrenttDate(isOnlyNumber: true)
          self.allMovieData = data.filter({ $0.releaseDate > currentDateStr })
          
          let cell = self.mainTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as! MainMovieReservationCell
          
          cell.movieReservationCollection.reloadData()
          self.mainTableView.reloadData()
        case .failure(let err):
          print(err.localizedDescription)
        }
      }
    } else if title == "박스오피스" {
      NetworkService.getAllMovieData(url) { (response) in
        switch response {
        case .success(let data):
          self.allMovieData = data
    
          let cell = self.mainTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as! MainMovieReservationCell
          
          cell.movieReservationCollection.reloadData()
          self.mainTableView.reloadData()
        case .failure(let err):
          print(err.localizedDescription)
        }
      }
    }
  }
  
  func touchUpItem(_ indexPath: Int) {
    let id = "\(shared.allMovieData[indexPath].movieID)"
    let url = ApiUrlData.ApiUrl(.movieDetailApi)
    let query = "?movie=\(id)"
    let fullUrl = url + query
    
    print(fullUrl)
      
    NetworkService.getMovieDetailData(fullUrl) { (result) in
      switch result {
      case .success(let data):
        self.shared.movieDetailData = data
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movieId = Int(id)!
        movieDetailVC.isWished = self.shared.allMovieData[indexPath].isWished
        self.present(movieDetailVC, animated: false)
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
  }
}

// MARK: MainEventCellDelegate
extension MainViewController: MainEventCellDelegate {
  func touchUpEventOwlStageButton(_ sender: UIButton, _ trailing: NSLayoutConstraint, _ leading:
    NSLayoutConstraint, _ stackViewWidth: CGFloat) {
    
    leading.constant = sender.frame.minX + 20
    trailing.constant = -(stackViewWidth - sender.frame.maxX - 20)
    self.view.layoutIfNeeded()
  }
}

// MARK: UITableViewDataSource
extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 12
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MainTopMediaPlayCell.identifier) as! MainTopMediaPlayCell
    
    cell.mainTopMediaPlayCellConfigure(
      imageData: mainPosterImageData!,
      titleStr: mainPosterTitleStr ?? "",
      subTitleStr: mainPosterSubTitleStr ?? ""
    )
    cell.selectionStyle = .none
    
    if indexPath.row == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieReservationCell.identifier) as! MainMovieReservationCell
      cell.allMovieData = allMovieData
      cell.selectionStyle = .none
      // Owl Stage Button Click Delegate
      cell.delegate = self
      return cell
    } else if indexPath.row == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainShortMenuCell.identifier) as! MainShortMenuCell
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 3 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainAdCell.identifier) as! MainAdCell
      guard let adImageNum: Int = (0...1).randomElement() else { return cell }
      let adImageArr: [UIImage] = [#imageLiteral(resourceName: "ad1"), #imageLiteral(resourceName: "ad2")]
      if adImageNum == 0 {
        cell.guideBGView.image = nil
        cell.guideBGView.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.968627451, alpha: 1)
      } else {
        cell.guideBGView.image = nil
        cell.guideBGView.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.3294117647, blue: 0.8470588235, alpha: 1)
      }
      cell.selectionStyle = .none
      cell.adImage.image = adImageArr[adImageNum]
      return cell
    } else if indexPath.row == 4 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainEventCell.identifier) as! MainEventCell
      // Owl Stage Button Click Delegate
      cell.delegate = self
      cell.eventImageData = eventImageData
      cell.eventTitleText = eventTitleStr
      cell.eventSubTitleText = eventSubTitleStr
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 5 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieBoxCell.identifier) as! MainMovieBoxCell
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 6 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainAdCell.identifier) as! MainAdCell
      guard let adImageNum: Int = (0...1).randomElement() else { return cell }
      let adImageArr: [UIImage] = [#imageLiteral(resourceName: "ad4"), #imageLiteral(resourceName: "ad3")]
      if adImageNum == 0 {
        cell.guideBGView.image = nil
        cell.guideBGView.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.1490196078, blue: 0.1529411765, alpha: 1)
      } else {
        cell.guideBGView.image = nil
        cell.guideBGView.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.2392156863, blue: 0.5803921569, alpha: 1)
      }
      cell.adImage.image = adImageArr[adImageNum]
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 7 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainMoviePostCell.identifier) as! MainMoviePostCell
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 8 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainBranchNewsCell.identifier) as! MainBranchNewsCell
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 9 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainNotificationCell.identifier) as! MainNotificationCell
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 10 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainAdCell.identifier) as! MainAdCell
      cell.guideBGView.image = #imageLiteral(resourceName: "newmain_boutiquebg")
      cell.adImage.image = #imageLiteral(resourceName: "lastbanner")
      cell.selectionStyle = .none
      return cell
    } else if indexPath.row == 11 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainFooterCell.identifier) as! MainFooterCell
      cell.selectionStyle = .none
      return cell
    }
    return cell
  }
}

// MARK: UITableViewDelegate
extension MainViewController: UITableViewDelegate {  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // 해더뷰 고정 해제
    let scrollHeaderHeight = ((UIScreen.main .bounds.width * 907) / 1080) + 10
    if scrollView.contentOffset.y >= scrollHeaderHeight {
      if isTop == false {
        return
      }
      mainTopView.topMediaVisualTopView.layer.borderWidth = 0.5
      mainTopView.titleImage.image = #imageLiteral(resourceName: "main_top_logo_purple")
      mainTopView.quickReservationButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      mainTopView.quickReservationButton.backgroundColor = UIColor.appColor(.megaBoxColor)
      mainTopView.quickReservationButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
      mainTopView.topMediaVisualTopView.alpha = 1
      mainTopView.topMediaVisualTopView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      mainTopView.hamburgerMenu.setImage(#imageLiteral(resourceName: "main_top_menu_gray_btn"), for: .normal)
      isTop.toggle()
    } else {
      if isTop == true {
        return
      }
      mainTopView.topMediaVisualTopView.layer.borderWidth = 0
      mainTopView.titleImage.image = #imageLiteral(resourceName: "main_top_logo_white")
      mainTopView.quickReservationButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      mainTopView.quickReservationButton.backgroundColor = .clear
      mainTopView.quickReservationButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
      mainTopView.topMediaVisualTopView.alpha = 0.3
      mainTopView.topMediaVisualTopView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      mainTopView.hamburgerMenu.setImage(#imageLiteral(resourceName: "main_top_menu_white_btn"), for: .normal)
      isTop.toggle()
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 11 {
      tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
  }
  
  // 현재 tableview Height 저장
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cellHeightDictionary.setObject(cell.frame.size.height, forKey: indexPath as NSCopying)
  }
  
  // 저장된 tableview height 적용
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    if let height = cellHeightDictionary.object(forKey: indexPath) as? Double {
      return CGFloat(height)
    }
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return (UIScreen.main.bounds.width * 907) / 1080
    } else if indexPath.row == 1 {
      // 영화예매
      return 430
    } else if indexPath.row == 2 {
      // Short메뉴
      return 90
    } else if indexPath.row == 3 {
      // 광고
      return 90
    } else if indexPath.row == 4 {
      // 이벤트
      return (((UIScreen.main.bounds.width) * 495) / 845) + 160
    } else if indexPath.row == 5 {
      // 무비박스
      return ((UIScreen.main.bounds.width - 20) * 460) / 708
    } else if indexPath.row == 6 {
      // 광고
      return 90
    } else if indexPath.row == 7 {
      // 무비포스트
      let width = UIScreen.main.bounds.width
      let height: CGFloat = width + 50
      return height
    } else if indexPath.row == 8 {
      // 지점소식
      return ((UIScreen.main.bounds.width) * 460) / 750
    } else if indexPath.row == 9 {
      // 공지사항
      return 130
    } else if indexPath.row == 10 {
      // 광고
      return 90
    } else if indexPath.row == 11 {
      // 푸터
      return 180
    }
    return 80
  }
}
