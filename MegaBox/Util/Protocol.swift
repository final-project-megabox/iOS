//
//  Protocol.swift
//  MegaBox
//
//  Created by 차수연 on 08/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol MenuTitleViewDelegate {
  func meunBarDidSelected(_ indexPath: IndexPath)
}

protocol QuickReservationViewDelegate {
  // 영화별 예매 버튼 클릭 후 QuickReservationViewController 띄움
  func farightButtonDidSelected()
  
  // 영화별 예매 버튼 쿨릭 후 취소 버튼 클릭
  func touchUpCancelButton()
}

//영화별 예매 버튼 클릭 후 X 버튼 클릭
protocol MovieCategoryReservationViewDelegate {
  func dismissButtonDidTapped()
}

// 로그인 버튼 클릭
protocol NavigationDrawerCellDelegate {
  func touchUpLoginButton()
}

// OwlStageOuter 버튼 클릭 (박스오피스, 상영예정, 큐레이션, 무대인사)
protocol MainMovieReservationCellDelegate {
  func touchUpOwlStageButton(_ sender: UIButton, _ trailing: NSLayoutConstraint, _ leading: NSLayoutConstraint, _ stackViewWidth: CGFloat)
}
