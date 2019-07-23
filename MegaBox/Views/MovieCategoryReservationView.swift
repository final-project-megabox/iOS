//
//  MovieCategoryReservationView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

struct MovieList {
  let title: String
  let type: String
  let duration: String
  let checkImage: String
  let ageImage: String
  var isSelect: Bool
}

class MovieCategoryReservationView: UIView {
  
  // MARK: Properties
  var reservationDelegate: MovieCategoryReservationViewDelegate?
  var delegate: MenuTitleViewDelegate?
  
  private let menuTitleView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let menuTitleViewBottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.8800999603, green: 0.8800999603, blue: 0.8800999603, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let menuTitleDismissButton: UIButton = {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(dismissButtonDidTpaaed), for: .touchUpInside)
    button.setImage(#imageLiteral(resourceName: "purpleCancel_icon"), for: .normal)
    button.tintColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let menuTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화 선택"
    label.textAlignment = .center
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
    button.isEnabled = false
    button.addTarget(self, action: #selector(didTapmenuTitleSelectbutton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let movieTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "보고싶은 하나의 영화를 선택해주세요."
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let allMovieButton: UIButton = {
    let button = UIButton()
    button.setTitle("모든영화", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let curationButton: UIButton = {
    let button = UIButton()
    button.setTitle("큐레이션", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  private let movieListTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  private var movieData = [MovieList]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    makeData()
    addSubView()
    autoLayout()
    setupTableView()
    
    
  }
  
  private func makeData() {
    for i in 0..<20 {
      let movie = MovieList(title: "스파이더맨: 파 프로 홈 \(i)", type: "디지털(자막),ATMOS(자막),3D(자막),3D ATMOS(자막)", duration: "000분", checkImage: "ticket_img_check", ageImage: "booking_middle_filrm_rating_all", isSelect: false)
      movieData.append(movie)
    }
  }
  
  
  private func addSubView() {
    addSubview(menuTitleView)
  
    menuTitleView.addSubview(menuTitleDismissButton)
    menuTitleView.addSubview(menuTitleLabel)
    menuTitleView.addSubview(menuTitleSelectbutton)
    menuTitleView.addSubview(menuTitleViewBottomLine)
    
    addSubview(movieTitleLabel)
    
    addSubview(allMovieButton)
    addSubview(curationButton)
    
    addSubview(movieListTableView)
    
  }
  
  private func autoLayout() {
    
    
    menuTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    menuTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    menuTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    menuTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    menuTitleDismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
    menuTitleDismissButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    menuTitleDismissButton.centerYAnchor.constraint(equalTo: menuTitleLabel.centerYAnchor).isActive = true
    
    menuTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
    menuTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    menuTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    menuTitleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    
    menuTitleSelectbutton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.5).isActive = true
    menuTitleSelectbutton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    menuTitleSelectbutton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    movieTitleLabel.topAnchor.constraint(equalTo: menuTitleView.bottomAnchor).isActive = true
    movieTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    movieTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    movieTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    menuTitleViewBottomLine.leadingAnchor.constraint(equalTo: menuTitleView.leadingAnchor).isActive = true
    menuTitleViewBottomLine.trailingAnchor.constraint(equalTo: menuTitleView.trailingAnchor).isActive = true
    menuTitleViewBottomLine.bottomAnchor.constraint(equalTo: menuTitleView.bottomAnchor).isActive = true
    menuTitleViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    allMovieButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
    allMovieButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    allMovieButton.trailingAnchor.constraint(equalTo: curationButton.leadingAnchor).isActive = true
    allMovieButton.bottomAnchor.constraint(equalTo: movieListTableView.topAnchor).isActive = true
    allMovieButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
  
    curationButton.topAnchor.constraint(equalTo: allMovieButton.topAnchor).isActive = true
    curationButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    curationButton.bottomAnchor.constraint(equalTo: allMovieButton.bottomAnchor).isActive = true
    curationButton.widthAnchor.constraint(equalTo: allMovieButton.widthAnchor).isActive = true
    curationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    movieListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    movieListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    movieListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
  }
  
  private func setupTableView() {
    movieListTableView.dataSource = self
    movieListTableView.delegate = self
    
    movieListTableView.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.identifier)
  }
  
  @objc func dismissButtonDidTpaaed() {
    reservationDelegate?.dismissButtonDidTapped()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    allMovieButton.touchUpButton(isTouched: true, width: allMovieButton.frame.width)
    curationButton.touchUpButton(isTouched: false, width: curationButton.frame.width)
  }
  
  @objc func didTapmenuTitleSelectbutton(_ sender: UIButton) {
    reservationDelegate?.touchUpSelectMovieButton()
  }
}


extension MovieCategoryReservationView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieData.count //영화 목록
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = movieListTableView.dequeueReusableCell(withIdentifier: MovieListCell.identifier, for: indexPath) as! MovieListCell
    
    cell.setting(movie: movieData[indexPath.row])
    
    return cell
  }
  
}

extension MovieCategoryReservationView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) as? MovieListCell else {return}
    
    for (index, _) in movieData.enumerated() {
      switch indexPath.row == index {
      case true:
        movieData[index].isSelect = true

        self.movieTitleLabel.text = cell.movieTitleLabel.text
        self.movieTitleLabel.textColor = #colorLiteral(red: 0.3568627451, green: 0.7450980392, blue: 0.7843137255, alpha: 1)
        
        self.menuTitleSelectbutton.isEnabled = true
        self.menuTitleSelectbutton.setTitleColor(#colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1), for: .normal)
        self.menuTitleSelectbutton.layer.borderColor = #colorLiteral(red: 0.2392156863, green: 0.1215686275, blue: 0.5568627451, alpha: 1)
      case false:
        movieData[index].isSelect = false
        

      }
    }
    tableView.reloadData()
    
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    guard let cell = tableView.cellForRow(at: indexPath) as? MovieListCell else {return}
    print(indexPath.row)
    switch movieData[indexPath.row].isSelect {
    case true:
      cell.isTrue()
    case false:
      cell.isFalse()
    }
  }
}
