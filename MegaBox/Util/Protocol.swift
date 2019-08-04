//
//  Protocol.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

// 네비게이션 드로우(햄버거 메뉴)
protocol NavigationDrawerViewDelegate {
  // X버튼 클릭 -> 메인화면으로
  func touchUpDismissButton()
  // 로그인 버튼 클릭
  func touchUpLoginButton()
  
  // MARK: - 로그인후
  //마이페이지 이동
  func touchUpUserNameButton()
  
  //환경설정으로 이동
  func touchUpSettingButton()
}

//로그인페이지
protocol LoginViewDelegate {
  // X버튼 클릭 -> 메인화면으로
  func touchUpSelectDismissButton()
  
  //로그인
  func touchUpLoginButton(id: String, pw: String)
  
  //회원가입
  func touchUpRegisterButton()
}

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
  func touchUpMenuTitleDismissButton(_ sender: UIButton)
  
  func sendTitleData()
  
  func sendMovieData(_ data: ReservationData)
}

protocol TheaterCategoryReservationHeaderViewDelegate {
  func touchUpPlaceButton()
  
  func touchUpDateButton()
}

// 영화관별 예매 영화 타이틀 선택 시
protocol TheaterCategorySectionCellDelegate {
  func touchUpMovieTitle()
}

// 영화관별 예매 영화 시간 선택 시
protocol TheaterCategoryCellDelegate {
  func touchUpMovieTime(_ data: ReservationData)
}

protocol MovieCategoryReservationViewDelegate {
  //영화별 예매 버튼 클릭 후 X 버튼 클릭
  func dismissButtonDidTapped()
  
  // 영화별 예매 버튼 클릭 후 선택완료버튼
  func touchUpSelectMovieButton()
  
  // 모든영화, 큐레이션 버튼
  func touchUpButton(_ sender: UIButton)
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

protocol selectPersonCountViewDelegate {
  func touchUpPlusButton(_ sender: UIButton)
  
  func touchUpFinishButton(_ sender: UIButton, reservationPersonCount: ReservationPersonCount?)
}

protocol ThreeSixMovieTheaterViewDelegate {
  // 좌석 선택시
  func touchUpThreeSixTheaterSeat(_ sender: UIButton)
}

protocol EightTwoMovieTheaterViewDelegate {
  // 좌석 선택시
  func touchUpEightTwoTheaterSeat(_ sender: UIButton)
}

protocol OneThreeZeroMovieTheaterViewDelegate {
  // 좌석 선택시
  func touchUpOneThreeZeroTheaterSeat(_ sender: UIButton)
}

protocol OneFourZeroMovieTheaterViewDelegate {
  // 좌석 선택시
  func touchUpOneFourZeroTheaterSeat(_ sender: UIButton)
}

protocol OneFiveZeroMovieTheaterViewDelegate {
  // 좌석 선택시
  func touchUpOneFiveZeroTheaterSeat(_ sender: UIButton)
}

//마이페이지 버튼 클릭 (홈, 뒤로가기)
protocol MyPageTopViewDelegate {
  func touchUpMenuButton(_ sender: UIButton)
  
  func touchUpDismissButton(_ sender: UIButton)
}


//환경설정 버튼 클릭 (홈, 뒤로가기)
protocol MyPageSettingTopViewDelegate {
  func touchUpMenuButton(_ sender: UIButton)
  
  func touchUpDismissButton(_ sender: UIButton)
  
}

protocol MyPageSettingContentViewDelegate: class {
  func touchUpLogoutButton(_ sender: UIButton)
}
