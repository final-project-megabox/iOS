//
//  SelectSeatViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

enum TheaterType: Int {
  case ThreeSixTheater = 36
  case EightTwoTheater = 82
  case OneThreeZero = 130
  case OneFourZero = 140
  case OneFiveZero = 150
}

class SelectSeatViewController: UIViewController {
  
  var timer: Timer!
  
  var movieTheaterNumber = 0
  
  var movieData: ReservationData? = nil
  
  var moneyCount: Int = 0
  
  var selectedSeatArr: [String] = []
  var selectedSeatButtonArr: [UIButton] = []
  var selectedSeatCoupleArr: [UIButton: UIButton?] = [:]
  
  let threeSixMovieTheaterView: ThreeSixMovieTheaterView = {
    let view = ThreeSixMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let eightTwoMovieTheaterView: EightTwoMovieTheaterView = {
    let view = EightTwoMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let oneThreeZeroMovieTheaterView: OneThreeZeroMovieTheaterView = {
    let view = OneThreeZeroMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let oneFourZeroMovieTheaterView: OneFourZeroMovieTheaterView = {
    let view = OneFourZeroMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let oneFiveZeroMovieTheaterView: OneFiveZeroMovieTheaterView = {
    let view = OneFiveZeroMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    threeSixMovieTheaterView.delegate = self
    eightTwoMovieTheaterView.delegate = self
    oneThreeZeroMovieTheaterView.delegate = self
    oneFourZeroMovieTheaterView.delegate = self
    oneFiveZeroMovieTheaterView.delegate = self
    
    setUpMovieTheaterView(movieTheaterNumber: movieTheaterNumber)
    checkReservationSeat(movieTheaterNumber: movieTheaterNumber)
    
    timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(startSplash), userInfo: nil, repeats: false)
  }
  
  private func calculateTotalMoney(sign: String, amount: Int, theaterType: TheaterType) {
    
    switch theaterType {
    case .ThreeSixTheater:
      if sign == "+" {
        moneyCount += amount
      } else {
        moneyCount -= amount
      }
      threeSixMovieTheaterView.changeMoneyCount = moneyCount * 11000
    case .EightTwoTheater:
      if sign == "+" {
        moneyCount += amount
        
      } else {
        moneyCount -= amount
      }
      eightTwoMovieTheaterView.changeMoneyCount = moneyCount * 11000
    case .OneThreeZero:
      if sign == "+" {
        moneyCount += amount
        
      } else {
        moneyCount -= amount
      }
      oneThreeZeroMovieTheaterView.changeMoneyCount = moneyCount * 11000
    case .OneFourZero:
      if sign == "+" {
        moneyCount += amount
      } else {
        moneyCount -= amount
      }
      oneFourZeroMovieTheaterView.changeMoneyCount = moneyCount * 11000
    case .OneFiveZero:
      if sign == "+" {
        moneyCount += amount
      } else {
        moneyCount -= amount
      }
      oneFiveZeroMovieTheaterView.changeMoneyCount = moneyCount * 11000
    }
  }
  
  private func isPossibleReservationLeftSeat(buttonArr: [UIButton], baseButton: UIButton, buttonIdx: Int) -> Bool {
    if buttonIdx == 1 { return false }
    
    let leftButton = buttonArr[buttonIdx - 1]
    
    guard let _ = Int(leftButton.accessibilityIdentifier!) else { return false }
    return true
  }
  
  private func isPossibleReservationRightSeat(buttonArr: [UIButton], baseButton: UIButton, buttonIdx: Int) -> Bool {
    if buttonIdx == buttonArr.count - 2 { return false }
    
    let rightButton = buttonArr[buttonIdx + 1]
    
    guard let _ = Int(rightButton.accessibilityIdentifier!) else { return false }
    return true
  }
  
  private func changeSelectButtonColor(isUnselected: Bool, baseButton: UIButton, relatedButton: UIButton?, allButton: [UIButton], totalCount: Int, whatTheater: TheaterType) {
    
    if isUnselected {
      for (idx, value) in selectedSeatArr.enumerated() {
        if value == baseButton.currentTitle {
          
          selectedSeatArr.remove(at: idx)
          baseButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          baseButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
          baseButton.isSelected.toggle()
          calculateTotalMoney(sign: "-", amount: 1, theaterType: whatTheater)
        }
      }
      
      for (idx, value) in selectedSeatArr.enumerated() {
        if value == relatedButton?.currentTitle {
          
          selectedSeatArr.remove(at: idx)
          relatedButton!.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          relatedButton!.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
          relatedButton!.isSelected.toggle()
          calculateTotalMoney(sign: "-", amount: 1, theaterType: whatTheater)
        }
      }
      
      if totalCount - selectedSeatArr.count == 1 {
        makeSingleChoiceScreen(totalCount, allButton)
      }
      
      switch whatTheater {
      case .ThreeSixTheater:
        threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .EightTwoTheater:
        eightTwoMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .OneThreeZero:
        oneThreeZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .OneFourZero:
        oneFourZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .OneFiveZero:
        oneFiveZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      }
      
      if totalCount - selectedSeatArr.count == 0 {
        switch whatTheater {
        case .ThreeSixTheater:
          threeSixMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .EightTwoTheater:
          eightTwoMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .OneThreeZero:
          oneThreeZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .OneFourZero:
          oneFourZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .OneFiveZero:
          oneFiveZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        }
      } else {
        switch whatTheater {
        case .ThreeSixTheater:
          threeSixMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .EightTwoTheater:
          eightTwoMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .OneThreeZero:
          oneThreeZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .OneFourZero:
          oneFourZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .OneFiveZero:
          oneFiveZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        }
      }
      
      return
    }
    
    var willSortButtonArr: [String] = []
    baseButton.backgroundColor = UIColor.appColor(.megaBoxColor)
    baseButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    baseButton.isSelected.toggle()
    willSortButtonArr.append(baseButton.currentTitle!)
    selectedSeatButtonArr.append(baseButton)
    guard let relatedButton = relatedButton else {
      self.selectedSeatArr.append(baseButton.currentTitle!)
      self.selectedSeatButtonArr.append(baseButton)
      
      switch whatTheater {
      case .ThreeSixTheater:
        threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .EightTwoTheater:
        eightTwoMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .OneThreeZero:
        oneThreeZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .OneFourZero:
        oneFourZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      case .OneFiveZero:
        oneFiveZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      }
      selectedSeatCoupleArr[baseButton] = nil
      
      calculateTotalMoney(sign: "+", amount: 1, theaterType: whatTheater)
      
      if totalCount - selectedSeatArr.count == 0 {
        switch whatTheater {
        case .ThreeSixTheater:
          threeSixMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .EightTwoTheater:
          eightTwoMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .OneThreeZero:
          oneThreeZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .OneFourZero:
          oneFourZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        case .OneFiveZero:
          oneFiveZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
        }
      } else {
        switch whatTheater {
        case .ThreeSixTheater:
          threeSixMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .EightTwoTheater:
          eightTwoMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .OneThreeZero:
          oneThreeZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .OneFourZero:
          oneFourZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        case .OneFiveZero:
          oneFiveZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
        }
      }
      
      return
    }
    
    relatedButton.backgroundColor = UIColor.appColor(.megaBoxColor)
    relatedButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    relatedButton.isSelected.toggle()
    willSortButtonArr.append(relatedButton.currentTitle!)
    selectedSeatButtonArr.append(relatedButton)
    willSortButtonArr.sort(by: {arg0, arg1 in arg0 < arg1 })
    
    for i in willSortButtonArr {
      self.selectedSeatArr.append(i)
    }
    
    if totalCount - selectedSeatArr.count == 1 {
      makeSingleChoiceScreen(totalCount, allButton)
    }
    
    switch whatTheater {
    case .ThreeSixTheater:
      threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
    case .EightTwoTheater:
      eightTwoMovieTheaterView.selectedSeatArr = self.selectedSeatArr
    case .OneThreeZero:
      oneThreeZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
    case .OneFourZero:
      oneFourZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
    case .OneFiveZero:
      oneFiveZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
    }
    
    if totalCount - selectedSeatArr.count == 0 {
      switch whatTheater {
      case .ThreeSixTheater:
        threeSixMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
      case .EightTwoTheater:
        eightTwoMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
      case .OneThreeZero:
        oneThreeZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
      case .OneFourZero:
        oneFourZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
      case .OneFiveZero:
        oneFiveZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.megaBoxColor)
      }
    } else {
      switch whatTheater {
      case .ThreeSixTheater:
        threeSixMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
      case .EightTwoTheater:
        eightTwoMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
      case .OneThreeZero:
        oneThreeZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
      case .OneFourZero:
        oneFourZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
      case .OneFiveZero:
        oneFiveZeroMovieTheaterView.selectOkButton.backgroundColor = UIColor.appColor(.defaultGrayColor)
      }
    }
    
    calculateTotalMoney(sign: "+", amount: 2, theaterType: whatTheater)
    
    selectedSeatCoupleArr[baseButton] = relatedButton
    selectedSeatCoupleArr[relatedButton] = baseButton
  }
  
  private func finishSingleChoiceScreen(buttonArr: [UIButton], exceptButtonArr: [UIButton]) {
    for (_, seat) in buttonArr.enumerated() {
      guard let seatIdentifierStr = seat.accessibilityIdentifier else { return }
      let seatIdentifierInt = Int(seatIdentifierStr) ?? 0
      if seatIdentifierInt % 2 == 0 {
        if selectedSeatArr.contains(seat.currentTitle!) {
        } else {
          if exceptButtonArr.contains(seat) {
            // ExceptButtonArr = 장애인 좌석
            seat.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
          } else {
            seat.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          }
          
          seat.isEnabled = true
        }
      }
    }
  }
  
  private func makeSingleChoiceScreen(_ totalCount: Int, _ buttonArr: [UIButton]) {
    for (_, seat) in buttonArr.enumerated() {
      guard let seatIdentifierStr = seat.accessibilityIdentifier else { return }
      let seatIdentifierInt = Int(seatIdentifierStr) ?? 0
      if seatIdentifierInt % 2 == 0 {
        if selectedSeatArr.contains(seat.currentTitle!) {
        } else {
          if seat.currentTitle == "" {
            seat.isEnabled = false
          } else {
            seat.isEnabled = false
            seat.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
          }
        }
      }
    }
  }
  
  @objc private func startSplash() {
    let selectPersonCountVC = SelectPersonCountViewController()
    selectPersonCountVC.modalPresentationStyle = .overCurrentContext
    selectPersonCountVC.modalTransitionStyle = .flipHorizontal
    selectPersonCountVC.movieTheaterNumber = movieTheaterNumber
    present(selectPersonCountVC, animated: false)
  }
  
  private func checkReservationSeat(movieTheaterNumber: Int) {
    switch movieTheaterNumber {
    case 36:
      guard let movieData = self.movieData else { return }
      let allSeatButtonArr = threeSixMovieTheaterView.seatButtonArr
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, buttonArr: allSeatButtonArr)
        if seatIdx == -1 {
        } else {
          threeSixMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          threeSixMovieTheaterView.seatButtonArr[seatIdx].isEnabled = false
          threeSixMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          threeSixMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    case 82:
      guard let movieData = self.movieData else { return }
      let allSeatButtonArr = eightTwoMovieTheaterView.seatButtonArr
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, buttonArr: allSeatButtonArr)
        if seatIdx == -1 {
        } else {
          eightTwoMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          eightTwoMovieTheaterView.seatButtonArr[seatIdx].isEnabled = false
          eightTwoMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          eightTwoMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    case 130:
      guard let movieData = self.movieData else { return }
      let allSeatButtonArr = oneThreeZeroMovieTheaterView.seatButtonArr
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, buttonArr: allSeatButtonArr)
        if seatIdx == -1 {
        } else {
          oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx].isEnabled = false
          oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    case 140:
      guard let movieData = self.movieData else { return }
      let allSeatButtonArr = oneFourZeroMovieTheaterView.seatButtonArr
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, buttonArr: allSeatButtonArr)
        if seatIdx == -1 {
        } else {
          oneFourZeroMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          oneFourZeroMovieTheaterView.seatButtonArr[seatIdx].isEnabled = false
          oneFourZeroMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          oneFourZeroMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    case 150:
      guard let movieData = self.movieData else { return }
      let allSeatButtonArr = oneFiveZeroMovieTheaterView.seatButtonArr
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, buttonArr: allSeatButtonArr)
        if seatIdx == -1 {
        } else {
          oneFiveZeroMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          oneFiveZeroMovieTheaterView.seatButtonArr[seatIdx].isEnabled = false
          oneFiveZeroMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          oneFiveZeroMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    default:
      break
    }
  }
  
  private func presentPaymentVC(seatNumber: [String], seatCount: Int) {
    
    guard let movieData = self.movieData else { return }
    let scheduleId = movieData.scheduleID
    let price = moneyCount * 11000
    
    let paymentVC = PaymentViewController()
    paymentVC.movieData = movieData
    paymentVC.paymentTotalMoney = price
    paymentVC.reservationSeatNumber = seatNumber
    self.present(paymentVC, animated: false)
  }
  
  private func returnSeatIndex(seatString: String, buttonArr: [UIButton]) -> Int {
    var resultIdx: Int = -1
    
    for (idx, value) in buttonArr.enumerated() {
      if seatString == value.currentTitle {
        resultIdx = idx
        break
      }
    }
    
    return resultIdx
  }
  
  private func setUpMovieTheaterView(movieTheaterNumber: Int) {
    let guide = view.safeAreaLayoutGuide
    
    switch movieTheaterNumber {
    case 36:
      view.addSubview(threeSixMovieTheaterView)
      threeSixMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      threeSixMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      threeSixMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      threeSixMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 82:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 130:
      view.addSubview(oneThreeZeroMovieTheaterView)
      oneThreeZeroMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      oneThreeZeroMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      oneThreeZeroMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      oneThreeZeroMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 140:
      view.addSubview(oneFourZeroMovieTheaterView)
      oneFourZeroMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      oneFourZeroMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      oneFourZeroMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      oneFourZeroMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 150:
      view.addSubview(oneFiveZeroMovieTheaterView)
      oneFiveZeroMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      oneFiveZeroMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      oneFiveZeroMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      oneFiveZeroMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    default:
      break
    }
  }
}

extension SelectSeatViewController: ThreeSixMovieTheaterViewDelegate {
  func touchUpThreeSixPreviousButton() {
    self.dismiss(animated: false)
  }
  
  func touchUpThreeSixDismissButton() {
    self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  func touchUpThreeSixTheaterSeat(_ sender: UIButton, _ buttonArr: [UIButton], totalCount: Int) {
    guard let buttonTitle = sender.currentTitle else { return }
    if buttonTitle == "" {
      // 이미 예약된 좌석입니다. (Alert)
    } else {
      // 선택 좌석 표시(보라색 반전 + 상단에 좌석 번호 추가)
      var seatIdx = returnSeatIndex(seatString: buttonTitle, buttonArr: buttonArr)
      if seatIdx < 14 {
        seatIdx += 1
      } else if seatIdx < 28 {
        seatIdx += 2
      } else if seatIdx < 42 {
        seatIdx += 3
      } else {
        seatIdx += 4
      }
    }
    
    let seatIdx = returnSeatIndex(seatString: buttonTitle, buttonArr: buttonArr)
    let selectedSeatCount = selectedSeatArr.count
    let disabledPerson: [UIButton] = [buttonArr[8], buttonArr[9], buttonArr[10]]
    
    if sender.isSelected {
      // 클릭한 좌석이 이미 선택되어 있다면
      // 클릭한 좌석의 identifier를 획득 (Int)
      if selectedSeatCoupleArr[sender] == nil {
        // 한자리 선택
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .ThreeSixTheater
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
      } else if let selectedButton = selectedSeatCoupleArr[sender] {
        // 두자리 선택
        guard let relatedButton = selectedSeatCoupleArr[selectedButton!] else { return }
        
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: selectedButton!,
          relatedButton: relatedButton!,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .ThreeSixTheater
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
        selectedSeatCoupleArr[selectedButton!] = nil
        selectedSeatCoupleArr[relatedButton!] = nil
      }
    } else {
      // 클릭한 좌석이 선택되어 있지 않다면
      if totalCount == selectedSeatCount {
        // 최대 선택 인원 초과
        UIAlertController.show(
          title: "",
          message: "좌석 선택이 완료되었습니다.",
          from: self
        )
        return
      }
      
      guard let buttonIdentifierStr = sender.accessibilityIdentifier else { return }
      let buttonIdentifierInt = Int(buttonIdentifierStr) ?? 0
      
      if totalCount - selectedSeatCount > 1 {
        // 남은 좌석 선택 인원이 2명 이상
        if buttonIdentifierInt % 2 == 0 {
          // 짝수
          if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 왼쪽 좌석 여유 있음
            let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: leftSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .ThreeSixTheater
            )
          } else {
            // 왼쪽 좌석이 불가능 한 경우
            // 오른쪽 좌석 확인
            if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: rightSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .ThreeSixTheater
              )
            } else {
              // 오른쪽 좌석도 불가능 한 경우
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .ThreeSixTheater
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        } else {
          // 홀수
          if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 오른쪽 좌석 여유 있음
            let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: rightSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .ThreeSixTheater
            )
          } else {
            // 오른쪽에 좌석 여유 없음
            // 왼쪽 확인
            if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: leftSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .ThreeSixTheater
              )
            } else {
              // 왼쪽도 불가능
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .ThreeSixTheater
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        }
      } else {
        // 남은 좌석 선택 인원이 1명
        // 한 자리 예약
        changeSelectButtonColor(
          isUnselected: false,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .ThreeSixTheater
        )
        
        finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
      }
    }
    
  }
  
  func touchUpThreeSixSelectOkButton(seatNumber: [String], seatCount: Int) {
    presentPaymentVC(seatNumber: seatNumber, seatCount: seatCount)
  }
}

extension SelectSeatViewController: EightTwoMovieTheaterViewDelegate {
  func touchUpEightTwoTheaterSeat(_ sender: UIButton, _ buttonArr: [UIButton], totalCount: Int) {
    guard let buttonTitle = sender.currentTitle else { return }
    let seatIdx = returnSeatIndex(seatString: buttonTitle, buttonArr: buttonArr)
    let selectedSeatCount = selectedSeatArr.count
    let disabledPerson: [UIButton] = [buttonArr[8], buttonArr[9], buttonArr[10]]
    
    if sender.isSelected {
      // 클릭한 좌석이 이미 선택되어 있다면
      // 클릭한 좌석의 identifier를 획득 (Int)
      if selectedSeatCoupleArr[sender] == nil {
        // 한자리 선택
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .EightTwoTheater
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
      } else if let selectedButton = selectedSeatCoupleArr[sender] {
        // 두자리 선택
        guard let relatedButton = selectedSeatCoupleArr[selectedButton!] else { return }
        
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: selectedButton!,
          relatedButton: relatedButton!,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .EightTwoTheater
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
        selectedSeatCoupleArr[selectedButton!] = nil
        selectedSeatCoupleArr[relatedButton!] = nil
      }
    } else {
      // 클릭한 좌석이 선택되어 있지 않다면
      if totalCount == selectedSeatCount {
        // 최대 선택 인원 초과
        UIAlertController.show(
          title: "",
          message: "좌석 선택이 완료되었습니다.",
          from: self
        )
        return
      }
      
      guard let buttonIdentifierStr = sender.accessibilityIdentifier else { return }
      let buttonIdentifierInt = Int(buttonIdentifierStr) ?? 0
      
      if totalCount - selectedSeatCount > 1 {
        // 남은 좌석 선택 인원이 2명 이상
        if buttonIdentifierInt % 2 == 0 {
          // 짝수
          if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 왼쪽 좌석 여유 있음
            let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: leftSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .EightTwoTheater
            )
          } else {
            // 왼쪽 좌석이 불가능 한 경우
            // 오른쪽 좌석 확인
            if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: rightSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .EightTwoTheater
              )
            } else {
              // 오른쪽 좌석도 불가능 한 경우
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .EightTwoTheater
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        } else {
          // 홀수
          if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 오른쪽 좌석 여유 있음
            let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: rightSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .EightTwoTheater
            )
          } else {
            // 오른쪽에 좌석 여유 없음
            // 왼쪽 확인
            if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: leftSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .EightTwoTheater
              )
            } else {
              // 왼쪽도 불가능
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .EightTwoTheater
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        }
      } else {
        // 남은 좌석 선택 인원이 1명
        // 한 자리 예약
        changeSelectButtonColor(
          isUnselected: false,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .EightTwoTheater
        )
        
        finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
      }
    }
  }
  
  func touchUpEightTwoPreviousButton() {
    self.dismiss(animated: false)
  }
  
  func touchUpEightTwoDismissButton() {
    self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  func touchUpEightTwoSelectOkButton(seatNumber: [String], seatCount: Int) {
    presentPaymentVC(seatNumber: seatNumber, seatCount: seatCount)
  }
}

extension SelectSeatViewController: OneThreeZeroMovieTheaterViewDelegate {
  func touchUpOneThreeZeroTheaterSeat(_ sender: UIButton, _ buttonArr: [UIButton], totalCount: Int) {
    guard let buttonTitle = sender.currentTitle else { return }
    let seatIdx = returnSeatIndex(seatString: buttonTitle, buttonArr: buttonArr)
    let selectedSeatCount = selectedSeatArr.count
    let disabledPerson: [UIButton] = [buttonArr[8], buttonArr[9], buttonArr[10]]
    
    if sender.isSelected {
      // 클릭한 좌석이 이미 선택되어 있다면
      // 클릭한 좌석의 identifier를 획득 (Int)
      if selectedSeatCoupleArr[sender] == nil {
        // 한자리 선택
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneThreeZero
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
      } else if let selectedButton = selectedSeatCoupleArr[sender] {
        // 두자리 선택
        guard let relatedButton = selectedSeatCoupleArr[selectedButton!] else { return }
        
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: selectedButton!,
          relatedButton: relatedButton!,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneThreeZero
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
        selectedSeatCoupleArr[selectedButton!] = nil
        selectedSeatCoupleArr[relatedButton!] = nil
      }
    } else {
      // 클릭한 좌석이 선택되어 있지 않다면
      if totalCount == selectedSeatCount {
        // 최대 선택 인원 초과
        UIAlertController.show(
          title: "",
          message: "좌석 선택이 완료되었습니다.",
          from: self
        )
        return
      }
      
      guard let buttonIdentifierStr = sender.accessibilityIdentifier else { return }
      let buttonIdentifierInt = Int(buttonIdentifierStr) ?? 0
      
      if totalCount - selectedSeatCount > 1 {
        // 남은 좌석 선택 인원이 2명 이상
        if buttonIdentifierInt % 2 == 0 {
          // 짝수
          if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 왼쪽 좌석 여유 있음
            let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: leftSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .OneThreeZero
            )
          } else {
            // 왼쪽 좌석이 불가능 한 경우
            // 오른쪽 좌석 확인
            if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: rightSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneThreeZero
              )
            } else {
              // 오른쪽 좌석도 불가능 한 경우
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneThreeZero
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        } else {
          // 홀수
          if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 오른쪽 좌석 여유 있음
            let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: rightSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .OneThreeZero
            )
          } else {
            // 오른쪽에 좌석 여유 없음
            // 왼쪽 확인
            if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: leftSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneThreeZero
              )
            } else {
              // 왼쪽도 불가능
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneThreeZero
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        }
      } else {
        // 남은 좌석 선택 인원이 1명
        // 한 자리 예약
        changeSelectButtonColor(
          isUnselected: false,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneThreeZero
        )
        
        finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
      }
    }
  }
  
  func touchUpOneThreeZeroPreviousButton() {
    self.dismiss(animated: false)
  }
  
  func touchUpOneThreeZeroDismissButton() {
    self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  func touchUpOneThreeZeroSelectOkButton(seatNumber: [String], seatCount: Int) {
    presentPaymentVC(seatNumber: seatNumber, seatCount: seatCount)
  }
}

extension SelectSeatViewController: OneFourZeroMovieTheaterViewDelegate {
  func touchUpOneFourZeroTheaterSeat(_ sender: UIButton, _ buttonArr: [UIButton], totalCount: Int) {
    guard let buttonTitle = sender.currentTitle else { return }
    let seatIdx = returnSeatIndex(seatString: buttonTitle, buttonArr: buttonArr)
    let selectedSeatCount = selectedSeatArr.count
    let disabledPerson: [UIButton] = [buttonArr[8], buttonArr[9], buttonArr[10]]
    
    if sender.isSelected {
      // 클릭한 좌석이 이미 선택되어 있다면
      // 클릭한 좌석의 identifier를 획득 (Int)
      if selectedSeatCoupleArr[sender] == nil {
        // 한자리 선택
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneFourZero
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
      } else if let selectedButton = selectedSeatCoupleArr[sender] {
        // 두자리 선택
        guard let relatedButton = selectedSeatCoupleArr[selectedButton!] else { return }
        
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: selectedButton!,
          relatedButton: relatedButton!,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneFourZero
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
        selectedSeatCoupleArr[selectedButton!] = nil
        selectedSeatCoupleArr[relatedButton!] = nil
      }
    } else {
      // 클릭한 좌석이 선택되어 있지 않다면
      if totalCount == selectedSeatCount {
        // 최대 선택 인원 초과
        UIAlertController.show(
          title: "",
          message: "좌석 선택이 완료되었습니다.",
          from: self
        )
        return
      }
      
      guard let buttonIdentifierStr = sender.accessibilityIdentifier else { return }
      let buttonIdentifierInt = Int(buttonIdentifierStr) ?? 0
      
      if totalCount - selectedSeatCount > 1 {
        // 남은 좌석 선택 인원이 2명 이상
        if buttonIdentifierInt % 2 == 0 {
          // 짝수
          if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 왼쪽 좌석 여유 있음
            let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: leftSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .OneFourZero
            )
          } else {
            // 왼쪽 좌석이 불가능 한 경우
            // 오른쪽 좌석 확인
            if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: rightSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFourZero
              )
            } else {
              // 오른쪽 좌석도 불가능 한 경우
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFourZero
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        } else {
          // 홀수
          if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 오른쪽 좌석 여유 있음
            let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: rightSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .OneFourZero
            )
          } else {
            // 오른쪽에 좌석 여유 없음
            // 왼쪽 확인
            if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: leftSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFourZero
              )
            } else {
              // 왼쪽도 불가능
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFourZero
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        }
      } else {
        // 남은 좌석 선택 인원이 1명
        // 한 자리 예약
        changeSelectButtonColor(
          isUnselected: false,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneFourZero
        )
        
        finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
      }
    }
  }
  
  func touchUpOneFourZeroPreviousButton() {
    self.dismiss(animated: false)
  }
  
  func touchUpOneFourZeroDismissButton() {
    self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  func touchUpOneFourZeroSelectOkButton(seatNumber: [String], seatCount: Int) {
    presentPaymentVC(seatNumber: seatNumber, seatCount: seatCount)
  }
}

extension SelectSeatViewController: OneFiveZeroMovieTheaterViewDelegate {
  func touchUpOneFiveZeroTheaterSeat(_ sender: UIButton, _ buttonArr: [UIButton], totalCount: Int) {
    guard let buttonTitle = sender.currentTitle else { return }
    let seatIdx = returnSeatIndex(seatString: buttonTitle, buttonArr: buttonArr)
    let selectedSeatCount = selectedSeatArr.count
    let disabledPerson: [UIButton] = [buttonArr[8], buttonArr[9], buttonArr[10]]
    
    if sender.isSelected {
      // 클릭한 좌석이 이미 선택되어 있다면
      // 클릭한 좌석의 identifier를 획득 (Int)
      if selectedSeatCoupleArr[sender] == nil {
        // 한자리 선택
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneFiveZero
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
      } else if let selectedButton = selectedSeatCoupleArr[sender] {
        // 두자리 선택
        guard let relatedButton = selectedSeatCoupleArr[selectedButton!] else { return }
        
        changeSelectButtonColor(
          isUnselected: true,
          baseButton: selectedButton!,
          relatedButton: relatedButton!,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneFiveZero
        )
        if totalCount - selectedSeatArr.count > 1 {
          finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
        }
        selectedSeatCoupleArr[selectedButton!] = nil
        selectedSeatCoupleArr[relatedButton!] = nil
      }
    } else {
      // 클릭한 좌석이 선택되어 있지 않다면
      if totalCount == selectedSeatCount {
        // 최대 선택 인원 초과
        UIAlertController.show(
          title: "",
          message: "좌석 선택이 완료되었습니다.",
          from: self
        )
        return
      }
      
      guard let buttonIdentifierStr = sender.accessibilityIdentifier else { return }
      let buttonIdentifierInt = Int(buttonIdentifierStr) ?? 0
      
      if totalCount - selectedSeatCount > 1 {
        // 남은 좌석 선택 인원이 2명 이상
        if buttonIdentifierInt % 2 == 0 {
          // 짝수
          if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 왼쪽 좌석 여유 있음
            let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: leftSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .OneFiveZero
            )
          } else {
            // 왼쪽 좌석이 불가능 한 경우
            // 오른쪽 좌석 확인
            if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: rightSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFiveZero
              )
            } else {
              // 오른쪽 좌석도 불가능 한 경우
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFiveZero
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        } else {
          // 홀수
          if isPossibleReservationRightSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
            // 오른쪽 좌석 여유 있음
            let rightSeatButton: UIButton = buttonArr[seatIdx + 1]
            changeSelectButtonColor(
              isUnselected: false,
              baseButton: sender,
              relatedButton: rightSeatButton,
              allButton: buttonArr,
              totalCount: totalCount,
              whatTheater: .OneFiveZero
            )
          } else {
            // 오른쪽에 좌석 여유 없음
            // 왼쪽 확인
            if isPossibleReservationLeftSeat(buttonArr: buttonArr, baseButton: sender, buttonIdx: seatIdx) {
              let leftSeatButton: UIButton = buttonArr[seatIdx - 1]
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: leftSeatButton,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFiveZero
              )
            } else {
              // 왼쪽도 불가능
              // 한 자리 예약
              changeSelectButtonColor(
                isUnselected: false,
                baseButton: sender,
                relatedButton: nil,
                allButton: buttonArr,
                totalCount: totalCount,
                whatTheater: .OneFiveZero
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
            }
          }
        }
      } else {
        // 남은 좌석 선택 인원이 1명
        // 한 자리 예약
        changeSelectButtonColor(
          isUnselected: false,
          baseButton: sender,
          relatedButton: nil,
          allButton: buttonArr,
          totalCount: totalCount,
          whatTheater: .OneFiveZero
        )
        
        finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: disabledPerson)
      }
    }
  }
  
  func touchUpOneFiveZeroPreviousButton() {
    self.dismiss(animated: false)
  }
  
  func touchUpOneFiveZeroDismissButton() {
    self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
  
  func touchUpOneFiveZeroSelectOkButton(seatNumber: [String], seatCount: Int) {
    presentPaymentVC(seatNumber: seatNumber, seatCount: seatCount)
  }
}
