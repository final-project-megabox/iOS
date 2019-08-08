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
      let formatter = NumberFormatter()
      formatter.locale = Locale(identifier: "ko_KR")
      formatter.numberStyle = .decimal
      if let formattedTipAmount = formatter.string(from: paymentTotalMoney as NSNumber) {
        paymentView.totalMoneyRightLabel.text = "\(formattedTipAmount)원"
        paymentView.remainMoneyRightLabel.text = "\(formattedTipAmount)원"
        paymentView.okCashbagRightLabel.text = "적립대상금 : \(formattedTipAmount) 원"
      }
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
    
    let grade = movieData?.age
    var gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
    if grade == "전체 관람" {
      gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
    } else if grade == "12세 관람가" {
      gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_12")
    } else if grade == "15세 관람가" {
      gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_15")
    } else {
      gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_18")
    }
    
    paymentView.movieGradeImage.image = gradeImage
    paymentView.movieTitleLabel.text = movieData?.movie
    paymentView.movieTypeLabel.text = movieData?.types[0]
    
    let urlStr = movieData!.imgURL
    let url = URL(string: urlStr)!
    do {
      let movieThumbnail = try Data(contentsOf: url)
      paymentView.movieThumbnailImage.image = UIImage(data: movieThumbnail)
    } catch {
    }
    
    paymentView.dateLabel.text = "\(String(describing: movieData!.date)) | \(String(describing: movieData!.startTime))"
    paymentView.screenLabel.text = "\(String(describing: movieData!.theater)) \(String(describing: movieData!.screen))관"
    paymentView.personLabel.text = "일반 \(reservationSeatNumber.count)명"
    
    var seat: String = ""
    for i in reservationSeatNumber {
      seat += "\(i)번 "
    }
    paymentView.seatLabel.text = seat
    
    
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
          UIAlertController.completionShow(title: "", message: "결제가 완료되었습니다.", from: self, completion: { result in
            
            guard let vc = self.presentingViewController else { return }
            
            while (vc.presentingViewController != nil) {
              vc.dismiss(animated: false, completion: nil)
            }
          })
          case .failure(let err):
          print(err.localizedDescription)
        }
    }
  }
}
