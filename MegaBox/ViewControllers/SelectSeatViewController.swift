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
  
  let urlStr = "http://megabox.hellocoding.shop//database/reservationSecond/"
  var timer: Timer!
  
  var movieTheaterNumber = 0
  
  var movieData: ReservationData? = nil
  
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
  
  private func isPossibleReservationLeftSeat(buttonArr: [UIButton], baseButton: UIButton, buttonIdx: Int) -> Bool {
    if buttonIdx == 1 {
      // Null (제일 첫번째)
      return false
    }
    
    let leftButton = buttonArr[buttonIdx - 1]
    
    guard let _ = Int(leftButton.accessibilityIdentifier!) else { return false }
    return true
  }
  
  private func isPossibleReservationRightSeat(buttonArr: [UIButton], baseButton: UIButton, buttonIdx: Int) -> Bool {
    if buttonIdx == buttonArr.count - 2 {
      // Null (제일 구석)
      return false
    }
    
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
        }
      }
      
      for (idx, value) in selectedSeatArr.enumerated() {
        if value == relatedButton?.currentTitle {
          
          selectedSeatArr.remove(at: idx)
          relatedButton!.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          relatedButton!.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
          relatedButton!.isSelected.toggle()
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
          seat.isEnabled = false
          seat.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
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
          if seatIdx < 14 {
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 1].accessibilityIdentifier = ""
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 1].setTitle("", for: .normal)
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 1].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
          } else if seatIdx < 28 {
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 2].accessibilityIdentifier = ""
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 2].setTitle("", for: .normal)
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 2].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
          } else if seatIdx < 42 {
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 3].accessibilityIdentifier = ""
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 3].setTitle("", for: .normal)
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 3].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
          } else {
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 4].accessibilityIdentifier = ""
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 4].setTitle("", for: .normal)
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 4].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
          }
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
          oneFiveZeroMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          oneFiveZeroMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    default:
      break
    }
  }
  
  private func pushReservationSeatData(seatNumber: [String], seatCount: Int) {
    
    guard let movieData = self.movieData else { return }
    let scheduleId = movieData.scheduleID
    let price = seatCount * 10000
    
    NetworkService.pushSeatReservationData(
      urlStr,
      scheduleId: scheduleId,
      seatNumber: seatNumber,
      price: price,
      seatCount: seatCount) { result in
        switch result {
        case .success:
          let paymentVC = PaymentViewController()
          paymentVC.movieData = movieData
          self.present(paymentVC, animated: false)
        case .failure(let err):
          print(err.localizedDescription)
        }
    }
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
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: buttonArr)
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
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
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
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: buttonArr)
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
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
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
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: buttonArr)
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
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
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
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: buttonArr)
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
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
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
                whatTheater: TheaterType.OneFiveZero
              )
              
              finishSingleChoiceScreen(buttonArr: buttonArr, exceptButtonArr: buttonArr)
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
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
  }
}
