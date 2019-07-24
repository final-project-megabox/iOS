//
//  Protocol.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol MenuTitleViewDelegate {
  func meunBarDidSelected(_ indexPath: IndexPath)
}

protocol QuickReservationViewDelegate {
  // 영화별 예매 버튼 클릭 후 QuickReservationViewController 띄움
  func touchUpfarightButton()
  func touchUpfaleftButton()
  
  // 영화별 예매 버튼 쿨릭 후 취소 버튼 클릭
  func touchUpCancelButton()
}

protocol TheaterCategorySelectTheaterViewDelegate {
  // 영화관별 예매 버튼 쿨릭 후 X 버튼 클릭
  func touchUpCancelButton()
  
  // 영화관별 예매 버튼 쿨릭 후 선택완료 버튼 클릭
  func touchUpmenuTitleSelectbutton()
}

protocol TheaterCategoryReservationViewDelegate {
  func touchUpMenuTitleDismissButton()
}


protocol MovieCategoryReservationViewDelegate {
  //영화별 예매 버튼 클릭 후 X 버튼 클릭
  func dismissButtonDidTapped()
  
  // 영화별 예매 버튼 클릭 후 선택완료버튼
  func touchUpSelectMovieButton()
  
  // 모든영화, 큐레이션 버튼
  func touchUpButton(_ sender: UIButton)
}

// 로그인 버튼 클릭
protocol NavigationDrawerViewDelegate {
  func touchUpLoginButton()
}

// OwlStageOuter 버튼 클릭 (박스오피스, 상영예정, 큐레이션, 무대인사)
protocol MainMovieReservationCellDelegate {
  func touchUpReservationOwlStageButton(_ sender: UIButton, _ trailing: NSLayoutConstraint, _ leading: NSLayoutConstraint, _ stackViewWidth: CGFloat)
}

// OwlStageOuter 버튼 클릭 (전체, 메가박스, 영화, 제휴, 영화관)
protocol MainEventCellDelegate {
  func touchUpEventOwlStageButton(_ sender: UIButton, _ trailing: NSLayoutConstraint, _ leading: NSLayoutConstraint, _ stackViewWidth: CGFloat)
}

protocol MovieCategorySelectTheatherViewDelegate {
  //영화별 예매 -> 뒤로가기(메인화면으로)
  func touchUpDismissButton()
  
  //영화별 예매 -> 영화선택
  func touchUpSelectMovieButton()
  
  //영화별 예매 -> 영화관 선택
  func touchUpSelectTheaterButton()
  
  //영화별 예매 -> 날짜 선택
  func touchUpDateButton()
  
}

//로그인페이지
protocol LoginViewDelegate {
  // X버튼 클릭 -> 메인화면으로
  func touchUpSelectDismissButton()
  
  //임시 - 로그인 버튼 클릭후 마이페이지
  func touchUpLoginButton()
}
