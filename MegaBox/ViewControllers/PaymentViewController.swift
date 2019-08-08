//
//  PaymentViewController.swift
//  MegaBox
//
//  Created by Fury on 05/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
  
  var movieData: ReservationData? = nil

  var reservationSeatNumber: [String] = []
  
  var paymentTotalMoney: Int = 0 {
    didSet {
      paymentView.totalMoneyRightLabel.text = "\(paymentTotalMoney)원"
      paymentView.remainMoneyRightLabel.text = "\(paymentTotalMoney)원"
      paymentView.okCashbagRightLabel.text = "적립대상금 : \(paymentTotalMoney) 원"
    }
  }
  
  let paymentView: PaymentView = {
    let view = PaymentView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    paymentView.delegate = self
    setupPaymentView()
  }
  
  private func setupPaymentView() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(paymentView)
    paymentView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    paymentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    paymentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    paymentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
}

extension PaymentViewController: PaymentViewDelegate {
  func touchUpPaymentButton() {
    
    guard let scheduleID = movieData?.scheduleID else { return }
    NetworkService.pushSeatReservationData(
      ApiUrlData.ApiUrl(.movieReservationDataApi),
      scheduleId: scheduleID,
      seatNumber: reservationSeatNumber,
      price: paymentTotalMoney,
      seatCount: reservationSeatNumber.count) { result in
        switch result {
        case .success:
          UIAlertController.show(title: "", message: "결제가 완료되었습니다.", from: self)
        case .failure(let err):
          print(err.localizedDescription)
        }
    }
    
    self.dismiss(animated: true, completion: nil)
  }
}
