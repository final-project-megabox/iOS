//
//  NavigationDrawerCell.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//
import UIKit

class NavigationDrawerCell: UICollectionViewCell {
  static let identifier = "NavigationDrawerCell"
  
  private let guideTopView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let guideBottomView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let naviDrawerHomeButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_home_nor"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let naviDrawerDivisionLine: UIImageView = {
    let view = UIImageView()
    view.image = #imageLiteral(resourceName: "common_img_bar_h39")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let naviDrawerNoticeButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_notice_nor"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let naviDrawerSettingButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_setting_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let naviDrawerBarcodeButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "menu_slide_barcode_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let naviDrawerCancelButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_close_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.layer.borderWidth = 0.5
    button.layer.borderColor = #colorLiteral(red: 0.6375336647, green: 0.6337464452, blue: 0.6404464841, alpha: 1)
    button.layer.cornerRadius = 3
    button.backgroundColor = #colorLiteral(red: 0.9218966365, green: 0.9164164066, blue: 0.9261092544, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let joinButton: UIButton = {
    let button = UIButton()
    button.setTitle("회원가입", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    button.setTitleColor(#colorLiteral(red: 0.4389696717, green: 0.476914525, blue: 0.5277227759, alpha: 1), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let firstNaviDrawerDivisionLine: UIImageView = {
    let view = UIImageView()
    view.image = #imageLiteral(resourceName: "common_img_bar_h39")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let searchingIdPwButton: UIButton = {
    let button = UIButton()
    button.setTitle("ID/PW 찾기", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    button.setTitleColor(#colorLiteral(red: 0.4389696717, green: 0.476914525, blue: 0.5277227759, alpha: 1), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let secondNaviDrawerDivisionLine: UIImageView = {
    let view = UIImageView()
    view.image = #imageLiteral(resourceName: "common_img_bar_h39")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let checkingReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("비회원 예매확인", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    button.setTitleColor(#colorLiteral(red: 0.4389696717, green: 0.476914525, blue: 0.5277227759, alpha: 1), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let theaterCategoryReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("영화관별 예매", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.layer.borderColor = UIColor.appColor(.defaultGrayColor).cgColor
    button.layer.borderWidth = 1
    button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let movieCategoryReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("영화별 예매", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.layer.borderColor = UIColor.appColor(.defaultGrayColor).cgColor
    button.layer.borderWidth = 1
    button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let movieButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_movie_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let movieLabel: UILabel = {
    let label = UILabel()
    label.text = "영화"
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let qrationButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_curation_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let qrationLabel: UILabel = {
    let label = UILabel()
    label.text = "큐레이션"
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let myMegaboxButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_mybox_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let myMegaboxLabel: UILabel = {
    let label = UILabel()
    label.text = "나의 메가박스"
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let storeButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_store_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let storeLabel: UILabel = {
    let label = UILabel()
    label.text = "스토어"
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let theaterButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_cinema_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let theaterLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관"
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let eventButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "btn_slid_event_nor"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let eventLabel: UILabel = {
    let label = UILabel()
    label.text = "이벤트"
    label.font = UIFont.systemFont(ofSize: 13, weight: .light)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let verticalDivisionLine: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.appColor(.defaultGrayColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let moviePostButton: UIButton = {
    let button = UIButton()
    button.setTitle("• 무비포스트", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let photoCardButton: UIButton = {
    let button = UIButton()
    button.setTitle("• 포토카드", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let privateReservationButton: UIButton = {
    let button = UIButton()
    button.setTitle("• 프라이빗예매", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let specialMembershipButton: UIButton = {
    let button = UIButton()
    button.setTitle("• 스페셜멤버십", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let serviceButton: UIButton = {
    let button = UIButton()
    button.setTitle("• 고객센터", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let discountButton: UIButton = {
    let button = UIButton()
    button.setTitle("• 할인카드안내", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let noticeButton: UIButton = {
    let button = UIButton()
    button.setTitle("공지사항", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    button.setImage(#imageLiteral(resourceName: "btn_slid_notice_icon"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.layer.borderColor = UIColor.appColor(.defaultGrayColor).cgColor
    button.layer.borderWidth = 1
    button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.appColor(.defaultGrayColor)
    setupPropertiesView()
    setupButtonsFontAttribute1()
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    
  }
  
  private func setupButtonsFontAttribute1() {
    theaterCategoryReservationButton.titleLabel?.attributedText = adaptButtonBoldFont(theaterCategoryReservationButton, boldText: "영화관별")
    
    movieCategoryReservationButton.titleLabel?.attributedText = adaptButtonBoldFont(movieCategoryReservationButton, boldText: "영화별")
  }
  
  private func adaptButtonBoldFont(_ button: UIButton, boldText: String) -> NSAttributedString {
    let fontSize = UIFont.boldSystemFont(ofSize: 13)
    let attributedStr = NSMutableAttributedString(string: button.titleLabel?.text ?? "")
    attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: fontSize, range: (button.titleLabel!.text! as NSString).range(of: boldText))
    
    return attributedStr
  }
  
  private func setupPropertiesView() {
    let margin: CGFloat = 10
    contentView.addSubview(guideTopView)
    guideTopView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    guideTopView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    guideTopView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    
    contentView.addSubview(guideBottomView)
    guideBottomView.topAnchor.constraint(equalTo: guideTopView.bottomAnchor, constant: margin).isActive = true
    guideBottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    guideBottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    guideBottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    guideBottomView.heightAnchor.constraint(equalTo: guideTopView.heightAnchor, multiplier: 2.5).isActive = true
    
    guideTopView.addSubview(naviDrawerHomeButton)
    naviDrawerHomeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin / 2).isActive = true
    naviDrawerHomeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin / 2).isActive = true
    naviDrawerHomeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    naviDrawerHomeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    guideTopView.addSubview(naviDrawerDivisionLine)
    naviDrawerDivisionLine.centerYAnchor.constraint(equalTo: naviDrawerHomeButton.centerYAnchor).isActive = true
    naviDrawerDivisionLine.leadingAnchor.constraint(equalTo: naviDrawerHomeButton.trailingAnchor, constant: margin / 2).isActive = true
    naviDrawerDivisionLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
    naviDrawerDivisionLine.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
    guideTopView.addSubview(naviDrawerNoticeButton)
    naviDrawerNoticeButton.centerYAnchor.constraint(equalTo: naviDrawerHomeButton.centerYAnchor).isActive = true
    naviDrawerNoticeButton.leadingAnchor.constraint(equalTo: naviDrawerDivisionLine.trailingAnchor, constant: margin / 2).isActive = true
    naviDrawerNoticeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    naviDrawerNoticeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    guideTopView.addSubview(naviDrawerSettingButton)
    naviDrawerSettingButton.centerYAnchor.constraint(equalTo: naviDrawerHomeButton.centerYAnchor).isActive = true
    naviDrawerSettingButton.leadingAnchor.constraint(equalTo: naviDrawerNoticeButton.trailingAnchor, constant: margin / 2).isActive = true
    naviDrawerSettingButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    naviDrawerSettingButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    guideTopView.addSubview(naviDrawerBarcodeButton)
    naviDrawerBarcodeButton.centerYAnchor.constraint(equalTo: naviDrawerHomeButton.centerYAnchor).isActive = true
    naviDrawerBarcodeButton.leadingAnchor.constraint(equalTo: naviDrawerSettingButton.trailingAnchor, constant: margin / 2).isActive = true
    naviDrawerBarcodeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    naviDrawerBarcodeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    guideTopView.addSubview(naviDrawerCancelButton)
    naviDrawerCancelButton.centerYAnchor.constraint(equalTo: naviDrawerHomeButton.centerYAnchor).isActive = true
    naviDrawerCancelButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin / 2).isActive = true
    naviDrawerCancelButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    naviDrawerCancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    guideTopView.addSubview(loginButton)
    loginButton.topAnchor.constraint(equalTo: naviDrawerHomeButton.bottomAnchor, constant: margin * 3).isActive = true
    loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    loginButton.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2.5).isActive = true
    loginButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    
    guideTopView.addSubview(joinButton)
    joinButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: margin).isActive = true
    joinButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 2).isActive = true
    
    guideTopView.addSubview(firstNaviDrawerDivisionLine)
    firstNaviDrawerDivisionLine.centerYAnchor.constraint(equalTo: joinButton.centerYAnchor).isActive = true
    firstNaviDrawerDivisionLine.trailingAnchor.constraint(equalTo: joinButton.trailingAnchor, constant: margin).isActive = true
    firstNaviDrawerDivisionLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
    firstNaviDrawerDivisionLine.heightAnchor.constraint(equalToConstant: 13).isActive = true
    
    guideTopView.addSubview(searchingIdPwButton)
    searchingIdPwButton.centerYAnchor.constraint(equalTo: joinButton.centerYAnchor).isActive = true
    searchingIdPwButton.leadingAnchor.constraint(equalTo: firstNaviDrawerDivisionLine.trailingAnchor, constant: margin).isActive = true
    
    guideTopView.addSubview(secondNaviDrawerDivisionLine)
    secondNaviDrawerDivisionLine.centerYAnchor.constraint(equalTo: joinButton.centerYAnchor).isActive = true
    secondNaviDrawerDivisionLine.leadingAnchor.constraint(equalTo: searchingIdPwButton.trailingAnchor, constant: margin).isActive = true
    secondNaviDrawerDivisionLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
    secondNaviDrawerDivisionLine.heightAnchor.constraint(equalToConstant: 13).isActive = true
    
    guideTopView.addSubview(checkingReservationButton)
    checkingReservationButton.centerYAnchor.constraint(equalTo: joinButton.centerYAnchor).isActive = true
    checkingReservationButton.leadingAnchor.constraint(equalTo: secondNaviDrawerDivisionLine.trailingAnchor, constant: margin).isActive = true
    
    
    guideTopView.addSubview(theaterCategoryReservationButton)
    theaterCategoryReservationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    theaterCategoryReservationButton.bottomAnchor.constraint(equalTo:  guideTopView.bottomAnchor).isActive = true
    
    guideTopView.addSubview(movieCategoryReservationButton)
    movieCategoryReservationButton.leadingAnchor.constraint(equalTo: theaterCategoryReservationButton.trailingAnchor).isActive = true
    movieCategoryReservationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    movieCategoryReservationButton.bottomAnchor.constraint(equalTo: guideTopView.bottomAnchor).isActive = true
    movieCategoryReservationButton.widthAnchor.constraint(equalTo: theaterCategoryReservationButton.widthAnchor).isActive = true
    
    guideBottomView.addSubview(movieButton)
    movieButton.topAnchor.constraint(equalTo: guideBottomView.topAnchor, constant: margin * 2).isActive = true
    movieButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 2).isActive = true
    movieButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    movieButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    guideBottomView.addSubview(movieLabel)
    movieLabel.topAnchor.constraint(equalTo: movieButton.bottomAnchor).isActive = true
    movieLabel.centerXAnchor.constraint(equalTo: movieButton.centerXAnchor).isActive = true
    
    guideBottomView.addSubview(qrationButton)
    qrationButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    qrationButton.centerYAnchor.constraint(equalTo: movieButton.centerYAnchor).isActive = true
    qrationButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    qrationButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    guideBottomView.addSubview(qrationLabel)
    qrationLabel.topAnchor.constraint(equalTo: qrationButton.bottomAnchor).isActive = true
    qrationLabel.centerXAnchor.constraint(equalTo: qrationButton.centerXAnchor).isActive = true
    
    guideBottomView.addSubview(myMegaboxButton)
    myMegaboxButton.centerYAnchor.constraint(equalTo: movieButton.centerYAnchor).isActive = true
    myMegaboxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin * 2).isActive = true
    myMegaboxButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    myMegaboxButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    guideBottomView.addSubview(myMegaboxLabel)
    myMegaboxLabel.topAnchor.constraint(equalTo: myMegaboxButton.bottomAnchor).isActive = true
    myMegaboxLabel.centerXAnchor.constraint(equalTo: myMegaboxButton.centerXAnchor).isActive = true
    
    guideBottomView.addSubview(storeButton)
    storeButton.topAnchor.constraint(equalTo: movieLabel.bottomAnchor, constant: margin * 2).isActive = true
    storeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 2).isActive = true
    storeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    storeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    guideBottomView.addSubview(storeLabel)
    storeLabel.topAnchor.constraint(equalTo: storeButton.bottomAnchor).isActive = true
    storeLabel.centerXAnchor.constraint(equalTo: storeButton.centerXAnchor).isActive = true
    
    guideBottomView.addSubview(theaterButton)
    theaterButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    theaterButton.centerYAnchor.constraint(equalTo: storeButton.centerYAnchor).isActive = true
    theaterButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    theaterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    guideBottomView.addSubview(theaterLabel)
    theaterLabel.topAnchor.constraint(equalTo: theaterButton.bottomAnchor).isActive = true
    theaterLabel.centerXAnchor.constraint(equalTo: theaterButton.centerXAnchor).isActive = true
    
    
    guideBottomView.addSubview(eventButton)
    eventButton.centerYAnchor.constraint(equalTo: storeButton.centerYAnchor).isActive = true
    eventButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin * 2).isActive = true
    eventButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    eventButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    guideBottomView.addSubview(eventLabel)
    eventLabel.topAnchor.constraint(equalTo: eventButton.bottomAnchor).isActive = true
    eventLabel.centerXAnchor.constraint(equalTo: eventButton.centerXAnchor).isActive = true
    
    guideBottomView.addSubview(verticalDivisionLine)
    verticalDivisionLine.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: margin * 2).isActive = true
    verticalDivisionLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin).isActive = true
    verticalDivisionLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin).isActive = true
    verticalDivisionLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    guideBottomView.addSubview(moviePostButton)
    moviePostButton.topAnchor.constraint(equalTo: verticalDivisionLine.bottomAnchor, constant: margin * 2).isActive = true
    moviePostButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 3).isActive = true
    
    guideBottomView.addSubview(photoCardButton)
    photoCardButton.topAnchor.constraint(equalTo: verticalDivisionLine.bottomAnchor, constant: margin * 2).isActive = true
    photoCardButton.leadingAnchor.constraint(equalTo: moviePostButton.trailingAnchor).isActive = true
    photoCardButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    photoCardButton.widthAnchor.constraint(equalTo: moviePostButton.widthAnchor).isActive = true
    
    guideBottomView.addSubview(privateReservationButton)
    privateReservationButton.topAnchor.constraint(equalTo: moviePostButton.bottomAnchor, constant: margin * 2).isActive = true
    privateReservationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 3).isActive = true
    
    guideBottomView.addSubview(specialMembershipButton)
    specialMembershipButton.topAnchor.constraint(equalTo: photoCardButton.bottomAnchor, constant: margin * 2).isActive = true
    specialMembershipButton.leadingAnchor.constraint(equalTo: privateReservationButton.trailingAnchor).isActive = true
    specialMembershipButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    specialMembershipButton.widthAnchor.constraint(equalTo: privateReservationButton.widthAnchor).isActive = true
    
    guideBottomView.addSubview(serviceButton)
    serviceButton.topAnchor.constraint(equalTo: privateReservationButton.bottomAnchor, constant: margin * 2).isActive = true
    serviceButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 3).isActive = true
    
    guideBottomView.addSubview(discountButton)
    discountButton.topAnchor.constraint(equalTo: specialMembershipButton.bottomAnchor, constant: margin * 2).isActive = true
    discountButton.leadingAnchor.constraint(equalTo: serviceButton.trailingAnchor).isActive = true
    discountButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    discountButton.widthAnchor.constraint(equalTo: serviceButton.widthAnchor).isActive = true
    
    guideBottomView.addSubview(noticeButton)
    noticeButton.topAnchor.constraint(equalTo: discountButton.bottomAnchor, constant: margin * 2).isActive = true
    noticeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    noticeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
