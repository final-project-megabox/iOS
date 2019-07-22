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

//영화별 예매 버튼 클릭 후 X 버튼 클릭
protocol MovieCategoryReservationViewDelegate {
  func dismissButtonDidTapped()
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
