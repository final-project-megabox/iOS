//
//  MainMovieReservationCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainMovieReservationCell: UITableViewCell {
  static let identifier = "MainMovieReservationCell"
  var indicatorBarLeadingConstraint: NSLayoutConstraint!
  var indicatorBarTrailingConstraint: NSLayoutConstraint!
  
  private let shared = MovieDataManager.shared
  
  private var fontSize: CGFloat = 0
  
  var allMovieData: [MovieData]?
  
  var delegate: MainMovieReservationCellDelegate?
  
  private let guideBGView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "영화에매", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 16, alignment: .left)
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let plusButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "main_more_btn"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let divisionLine: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.appColor(.divisionLineColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var movieReservationStack: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  private let boxOfficeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("박스오피스", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 0
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    return button
  }()
  
  private let showingScheduleButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("상영예정", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 1
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let curationButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("큐레이션", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 2
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  private let stageGreetingButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("무대인사", for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.tag = 3
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    return button
  }()
  
  let indicatorBar: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let movieReservationCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.register(MovieReservationCollectionCell.self, forCellWithReuseIdentifier: MovieReservationCollectionCell.identifier)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8392156863, blue: 0.862745098, alpha: 1)
    getFontSize()
    setupProperties()
    makeAutoLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  @objc func touchUpOwlStageButton(_ sender: UIButton) {
    let stackViewWidth = guideBGView.frame.width
    delegate?.touchUpReservationOwlStageButton(sender, indicatorBarTrailingConstraint, indicatorBarLeadingConstraint, stackViewWidth)
  }
  
  private func getFontSize() {
    fontSize = ("가" as NSString).size(withAttributes: [NSAttributedString.Key.font : boxOfficeButton.titleLabel?.font ?? "가"]).width
  }
  
  private func setupProperties() {
    boxOfficeButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    showingScheduleButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    curationButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    stageGreetingButton.addTarget(self, action: #selector(touchUpOwlStageButton(_:)), for: .touchUpInside)
    
    movieReservationCollection.dataSource = self
    movieReservationCollection.delegate = self
    
    setupStackView()
  }
  
  private func setupStackView() {
    movieReservationStack = UIStackView(arrangedSubviews: [boxOfficeButton, showingScheduleButton, curationButton, stageGreetingButton])
    movieReservationStack.translatesAutoresizingMaskIntoConstraints = false
    movieReservationStack.axis = .horizontal
    movieReservationStack.alignment = .leading
    movieReservationStack.distribution = .fill
    movieReservationStack.spacing = 20
  }
  
  private func makeAutoLayout() {
    let margin: CGFloat = 10
    contentView.addSubview(guideBGView)
    guideBGView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin).isActive = true
    guideBGView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    guideBGView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    guideBGView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
    
    guideBGView.addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideBGView.addSubview(plusButton)
    plusButton.topAnchor.constraint(equalTo: guideBGView.topAnchor, constant: margin * 2).isActive = true
    plusButton.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin * 2).isActive = true
    plusButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
    plusButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    guideBGView.addSubview(divisionLine)
    divisionLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin - 2).isActive = true
    divisionLine.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    divisionLine.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -margin * 2).isActive = true
    divisionLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    
    guideBGView.addSubview(movieReservationStack)
    movieReservationStack.topAnchor.constraint(equalTo: divisionLine.bottomAnchor).isActive = true
    movieReservationStack.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideBGView.addSubview(indicatorBar)
    indicatorBar.topAnchor.constraint(equalTo: movieReservationStack.bottomAnchor, constant: -3).isActive = true
    indicatorBarLeadingConstraint = indicatorBar.leadingAnchor.constraint(equalTo: guideBGView.leadingAnchor, constant: margin * 2)
    indicatorBarLeadingConstraint.isActive = true
    indicatorBar.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
    indicatorBarTrailingConstraint = indicatorBar.trailingAnchor.constraint(equalTo: guideBGView.trailingAnchor, constant: -(UIScreen.main.bounds.width - 40) + (fontSize * 5))
    indicatorBarTrailingConstraint.isActive = true
    
    guideBGView.addSubview(movieReservationCollection)
    movieReservationCollection.topAnchor.constraint(equalTo: indicatorBar.bottomAnchor, constant: margin + 5).isActive = true
    movieReservationCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    movieReservationCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    movieReservationCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin * 2).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MainMovieReservationCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let allMovieData = allMovieData else { return 0 }
    return allMovieData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieReservationCollectionCell.identifier, for: indexPath) as! MovieReservationCollectionCell
    
    guard let movieData = allMovieData?[indexPath.row] else { return cell }
    let url = movieData.imgURL
    let dataURL = URL(string: url)!
    let task = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data else { return }
        cell.movieReservationCollectionCellConfigure(data, movieData, indexPath.row)
      }
    }
    task.resume()
    
    return cell
  }
}

extension MainMovieReservationCell: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    delegate?.touchUpItem(indexPath.row)
  }
}

extension MainMovieReservationCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = movieReservationCollection.frame.height
    
    return CGSize(width: UIScreen.main.bounds.width / 2.7, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}


