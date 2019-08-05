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
