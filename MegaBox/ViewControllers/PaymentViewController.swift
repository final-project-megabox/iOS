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
    UIAlertController.show(title: "", message: "결제가 완료되었습니다.", from: self)
    self.dismiss(animated: false, completion: nil)
  }
}
