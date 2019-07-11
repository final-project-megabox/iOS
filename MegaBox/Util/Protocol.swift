//
//  Protocol.swift
//  MegaBox
//
//  Created by 차수연 on 08/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

protocol MenuBarDelegate {
  func meunBarDidSelected(_ indexPath: IndexPath)
}


//영화별 예매 버튼 클릭 후 QuickReservationViewController 띄움
protocol QuickReservationViewDelegate {
  func farightButtonDidSelected()
}

//영화별 예매 버튼 클릭 후 X 버튼 클릭
protocol MovieCategoryReservationViewDelegate {
  func dismissButtonDidTapped()
}
