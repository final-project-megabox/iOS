//
//  SelectPersonCountViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectPersonCountViewController: UIViewController {
  
  var movieTheaterNumber: Int = 0
  
  let selectPersonCountView: SelectPersonCountView = {
    let view = SelectPersonCountView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectPersonCountView.delegate = self
    setupSelectPeopleCountView()
  }
  
  func setupSelectPeopleCountView() {
    view.addSubview(selectPersonCountView)
    
    let guide = view.safeAreaLayoutGuide
    selectPersonCountView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    selectPersonCountView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    selectPersonCountView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    selectPersonCountView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension SelectPersonCountViewController: selectPersonCountViewDelegate {
  func touchUpPersonCountPreviousButton() {
    presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
  }
  
  func touchUpPersonCountDismissButton() {
    self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  func touchUpFinishButton(_ sender: UIButton, reservationPersonCount: ReservationPersonCount?) {
    guard let reservationPersonCount = reservationPersonCount else {
      UIAlertController.show(title: "", message: "관람하실 인원을 선택해주세요.", from: self)
      return
    }
    
    let presentingVC = presentingViewController as! SelectSeatViewController
    
    switch movieTheaterNumber {
    case 36:
      presentingVC.threeSixMovieTheaterView.totalCount = reservationPersonCount.adultCount + reservationPersonCount.teenagerCount + reservationPersonCount.seniorCount
      presentingVC.threeSixMovieTheaterView.adultCount = reservationPersonCount.adultCount
      presentingVC.threeSixMovieTheaterView.teenagerCount = reservationPersonCount.teenagerCount
      presentingVC.threeSixMovieTheaterView.seniorCount = reservationPersonCount.seniorCount
    case 82:
      presentingVC.eightTwoMovieTheaterView.totalCount = reservationPersonCount.adultCount + reservationPersonCount.teenagerCount + reservationPersonCount.seniorCount
      presentingVC.eightTwoMovieTheaterView.adultCount = reservationPersonCount.adultCount
      presentingVC.eightTwoMovieTheaterView.teenagerCount = reservationPersonCount.teenagerCount
      presentingVC.eightTwoMovieTheaterView.seniorCount = reservationPersonCount.seniorCount
    case 130:
      presentingVC.oneThreeZeroMovieTheaterView.totalCount = reservationPersonCount.adultCount + reservationPersonCount.teenagerCount + reservationPersonCount.seniorCount
      presentingVC.oneThreeZeroMovieTheaterView.adultCount = reservationPersonCount.adultCount
      presentingVC.oneThreeZeroMovieTheaterView.teenagerCount = reservationPersonCount.teenagerCount
      presentingVC.oneThreeZeroMovieTheaterView.seniorCount = reservationPersonCount.seniorCount
    case 140:
      presentingVC.oneFourZeroMovieTheaterView.totalCount = reservationPersonCount.adultCount + reservationPersonCount.teenagerCount + reservationPersonCount.seniorCount
      presentingVC.oneFourZeroMovieTheaterView.adultCount = reservationPersonCount.adultCount
      presentingVC.oneFourZeroMovieTheaterView.teenagerCount = reservationPersonCount.teenagerCount
      presentingVC.oneFourZeroMovieTheaterView.seniorCount = reservationPersonCount.seniorCount
    case 150:
      presentingVC.oneFiveZeroMovieTheaterView.totalCount = reservationPersonCount.adultCount + reservationPersonCount.teenagerCount + reservationPersonCount.seniorCount
      presentingVC.oneFiveZeroMovieTheaterView.adultCount = reservationPersonCount.adultCount
      presentingVC.oneFiveZeroMovieTheaterView.teenagerCount = reservationPersonCount.teenagerCount
      presentingVC.oneFiveZeroMovieTheaterView.seniorCount = reservationPersonCount.seniorCount
    default:
      break
    }
    
    self.dismiss(animated: false, completion: nil)
  }

  func touchUpPlusButton(_ sender: UIButton) {
    UIAlertController.show(title: "", message: "인원선택은 총 8명까지 가능합니다", from: self)
  }
}
