//
//  MyPageContentView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageContentView: UIView {
  
  var delegate: MyPageContentViewDelegate?
  private let shared = UserDataManager.shared
  
  
  let myPageTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupMyPageContentView()
    setupTableView()
    

  }
  
  
  private func setupMyPageContentView() {
    myPageTableView.separatorStyle = .none
    
    addSubview(myPageTableView)
    myPageTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    myPageTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    myPageTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    myPageTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
  }
  
  private func setupTableView() {
    myPageTableView.dataSource = self
    
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func didTapSecondViewButton(_ sender: UIButton) {

    delegate?.touchUpWishMovieButton(sender: sender)
  }
  
  @objc func didTapThirdViewButton(_ sender: UIButton) {
    
    delegate?.touchUpWatchedMovieButton(sender: sender)
  }
  
}

extension MyPageContentView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let headerCell = MyPageHeaderCell()
    
    let one = MyPageOneContentCell()
    let two = MyPageTwoContentCell()
    let three = MyPageThreeContentCell()
    let four = MyPageFourContentCell()
    
    switch indexPath.row {
    case 0:
      headerCell.selectionStyle = .none
      headerCell.userName.text = "\(UserDefaults.standard.value(forKey: "UserName")!)"
      headerCell.userId.text = "\(UserDefaults.standard.value(forKey: "UserId")!)"
      return headerCell
    case 1:
      one.selectionStyle = .none
      one.firstContentLabel.text = "맴버십 포인트 정보"
      one.firstCountLabel.isHidden = true
      return one
    case 2:
      one.selectionStyle = .none
      one.firstContentLabel.text = "VIP쿠폰"
      one.firstCountLabel.text = "0"
      return one
    case 3:
      three.selectionStyle = .none
      three.firstContentLabel.text = "관람권/할인쿠폰/포토카드쿠폰"
      three.firstCountLabel.text = "0"
      three.secondContentLabel.text = "고객 만족도조사 발급쿠폰"
      three.secondCountLabel.text = "0"
      three.thirdContentLabel.text = "SKT T 데이터쿠폰"
      three.thirdCountLabel.text = "0"
      return three
    case 4:
      two.selectionStyle = .none
      two.firstContentLabel.text = "예매내역/취소내역"
      two.firstCountLabel.text = "0"
      two.secondContentLabel.text = "스토어 구매/취소내역"
      two.secondCountLabel.text = "0"
      return two
    case 5:
      two.selectionStyle = .none
      two.firstContentLabel.text = "선호영화관 설정"
      two.firstCountLabel.isHidden = true
      two.secondContentLabel.text = "자주쓰는 신용카드"
      two.secondCountLabel.isHidden = true
      return two
    case 6:
      three.selectionStyle = .none
      three.firstContentLabel.text = "1:1 문의내역"
      three.firstCountLabel.isHidden = true
      three.secondContentLabel.text = "단체관람/대관 문의내역"
      three.secondCountLabel.isHidden = true
      three.thirdContentLabel.text = "분실물 문의/접수 내역"
      three.thirdCountLabel.isHidden = true
      return three
    case 7:
      four.selectionStyle = .none
      four.firstContentLabel.text = "내가 남긴 한줄평"
      four.firstCountLabel.text = "0"
      four.secondContentLabel.text = "보고싶은 영화"
      let number1 = shared.myPageData?.wishMovieNumber ?? 0
      four.secondCountLabel.text = "\(number1)"
      four.secondView.addTarget(self, action: #selector(didTapSecondViewButton(_:)), for: .touchUpInside)
      four.thirdContentLabel.text = "내가 본 영화"
      let number2 = shared.myPageData?.watchedMovieNumber ?? 0
      four.thirdCountLabel.text = "\(number2)"
      four.thirdView.addTarget(self, action: #selector(didTapThirdViewButton(_:)), for: .touchUpInside)
      four.fourthContentLabel.text = "나의 무비포스트"
      four.fourthCountLabel.text = "0"
      return four
      
    default:
      return one
    }
    

    
  }

}
