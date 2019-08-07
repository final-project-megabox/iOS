//
//  SelectSeatViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectSeatViewController: UIViewController {
  
  let urlStr = "http://megabox.hellocoding.shop//database/reservationSecond/"
  var timer: Timer!
  
  var movieTheaterNumber = 0
  
  var movieData: ReservationData? = nil
  
  var selectedSeatArr: [String] = []
  
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
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, basePlusNum: 13)
        if seatIdx == -1 {
        } else {
          if seatIdx < 13 {
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 1].accessibilityIdentifier = ""
            threeSixMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
            threeSixMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
          } else if seatIdx < 26 {
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 2].accessibilityIdentifier = ""
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 2].setTitle("", for: .normal)
            threeSixMovieTheaterView.seatButtonArr[seatIdx + 2].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
          } else if seatIdx < 39 {
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
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, basePlusNum: 8)
        if seatIdx == -1 {
        } else {
          eightTwoMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          eightTwoMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          eightTwoMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    case 130:
      guard let movieData = self.movieData else { return }
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, basePlusNum: 15)
        if seatIdx == -1 {
        } else {
          oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    case 140:
      guard let movieData = self.movieData else { return }
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, basePlusNum: 16)
        if seatIdx == -1 {
        } else {
          oneFourZeroMovieTheaterView.seatButtonArr[seatIdx].accessibilityIdentifier = ""
          oneFourZeroMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
          oneFourZeroMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
        }
      }
    case 150:
      guard let movieData = self.movieData else { return }
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data, basePlusNum: 12)
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
  
  private func returnSeatIndex(seatString: String, basePlusNum: Int) -> Int {
    var resultIdx: Int = -1
    var resultStr: String = ""
    let digiSet = CharacterSet.decimalDigits
    
    for (_, ch) in seatString.unicodeScalars.enumerated() {
      if digiSet.contains(ch) {
        resultStr.append(String(ch))
      }
    }
    
    guard let resultValue = Int(resultStr) else { return -1 }
    
    if seatString.contains("A") {
      resultIdx = resultValue - 1
    } else if seatString.contains("B") {
      resultIdx = resultValue + (basePlusNum * 1) - 1
    } else if seatString.contains("C") {
      resultIdx = resultValue + (basePlusNum * 2) - 1
    } else if seatString.contains("D") {
      resultIdx = resultValue + (basePlusNum * 3) - 1
    } else if seatString.contains("E") {
      resultIdx = resultValue + (basePlusNum * 4) - 1
    } else if seatString.contains("F") {
      resultIdx = resultValue + (basePlusNum * 5) - 1
    } else if seatString.contains("G") {
      resultIdx = resultValue + (basePlusNum * 6) - 1
    } else if seatString.contains("H") {
      resultIdx = resultValue + (basePlusNum * 7) - 1
    } else if seatString.contains("I") {
      resultIdx = resultValue + (basePlusNum * 8) - 1
    } else if seatString.contains("J") {
      resultIdx = resultValue + (basePlusNum * 9) - 1
    } else if seatString.contains("K") {
      resultIdx = resultValue + (basePlusNum * 10) - 1
    } else if seatString.contains("L") {
      resultIdx = resultValue + (basePlusNum * 11) - 1
    } else if seatString.contains("M") {
      resultIdx = resultValue + (basePlusNum * 12) - 1
    } else {
      resultIdx = resultValue + (basePlusNum * 13) - 1
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
  func touchUpThreeSixTheaterSeat(_ sender: UIButton, totalCount: Int) {
    guard let buttonTitle = sender.currentTitle else { return }
    if buttonTitle == "" {
      // 이미 예약된 좌석입니다. (Alert)
    } else {
      // 선택 좌석 표시(보라색 반전 + 상단에 좌석 번호 추가)
      var seatIdx = returnSeatIndex(seatString: buttonTitle, basePlusNum: 13)
      if seatIdx < 13 {
        seatIdx += 1
      } else if seatIdx < 26 {
        seatIdx += 2
      } else if seatIdx < 39 {
        seatIdx += 3
      } else {
        seatIdx += 4
      }
      
      let button = threeSixMovieTheaterView.seatButtonArr[seatIdx]
      
      if seatIdx == 0 || threeSixMovieTheaterView.seatButtonArr[seatIdx - 1].currentTitle == "" {
        // A1, B1, C1, D1 (가장 왼쪽 라인)
        let seatNumTwoButton = threeSixMovieTheaterView.seatButtonArr[seatIdx + 1]
        
        if button.isSelected {
          if button.currentTitle == "A1" {
            button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            seatNumTwoButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            seatNumTwoButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
          } else {
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            seatNumTwoButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            seatNumTwoButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
          }
          
          for i in 0..<threeSixMovieTheaterView.selectedSeatArr.count {
            if threeSixMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
              selectedSeatArr.remove(at: i + 1)
              selectedSeatArr.remove(at: i)
              threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
              break
            }
          }
        } else {
          if totalCount - selectedSeatArr.count > 1 {
            // 버튼이 선택되어 있지 않으면
            button.backgroundColor = UIColor.appColor(.megaBoxColor)
            button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            seatNumTwoButton.backgroundColor = UIColor.appColor(.megaBoxColor)
            seatNumTwoButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            selectedSeatArr.append(button.currentTitle!)
            selectedSeatArr.append(seatNumTwoButton.currentTitle!)
            threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
          } else {
            // 버튼이 선택되어 있지 않으면 (1좌석 선택 남았을 때)
            button.backgroundColor = UIColor.appColor(.megaBoxColor)
            button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            selectedSeatArr.append(button.currentTitle!)
            threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
            
            for i in 0..<threeSixMovieTheaterView.selectedSeatArr.count {
              if threeSixMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
                selectedSeatArr.remove(at: i)
                threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
                break
              }
            }
          }
        }
      } else {
        if button.isSelected {
          if button.currentTitle == "A2" {
            button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
          } else {
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
          }
        } else {
          
        }
        
        if totalCount - selectedSeatArr.count > 1 {
          guard let buttonIdentifierStr = button.accessibilityIdentifier else { return }
          let buttonIdentifierInt = Int(buttonIdentifierStr) ?? 0
          if buttonIdentifierInt % 2 == 0 {
            // 짝수 좌석 선택
            let seatNumLeftButton = threeSixMovieTheaterView.seatButtonArr[seatIdx - 1]
          } else {
            // 홀수 좌석 선택
            let seatNumRightButton = threeSixMovieTheaterView.seatButtonArr[seatIdx + 1]
          }
        } else {
          // 버튼이 선택되어 있지 않으면 (1좌석 선택 남았을 때)
          button.backgroundColor = UIColor.appColor(.megaBoxColor)
          button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
          selectedSeatArr.append(button.currentTitle!)
          threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
          
          for i in 0..<threeSixMovieTheaterView.selectedSeatArr.count {
            if threeSixMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
              selectedSeatArr.remove(at: i)
              threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
              break
            }
          }
        }
      }
      
      
      
      
      
      
      
      if totalCount - selectedSeatArr.count > 1 {
        let button = threeSixMovieTheaterView.seatButtonArr[seatIdx]
        guard let buttonTitle = button.currentTitle else { return }
        
        if buttonTitle == "A1" || buttonTitle == "B1" || buttonTitle == "C1" || buttonTitle == "D1" {
          let button2 = threeSixMovieTheaterView.seatButtonArr[seatIdx + 1]
          
          if button.isSelected {
            if button.currentTitle == "A1" || button.currentTitle == "A2" {
              button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
              button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
              button2.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
              button2.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            } else {
              button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
              button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
              button2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
              button2.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            }
            
            for i in 0..<threeSixMovieTheaterView.selectedSeatArr.count {
              if threeSixMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
                selectedSeatArr.remove(at: i + 1)
                selectedSeatArr.remove(at: i)
                threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
                break
              }
            }
          } else {
            if selectedSeatArr.count == 8 {
              // 최대 8명까지 선택하실 수 있습니다.
              return
            }
            
            
            
            
          }
          button.isSelected.toggle()
          button2.isSelected.toggle()
        }
      } else {
        
      }
      
      //      let button = threeSixMovieTheaterView.seatButtonArr[seatIdx]
      
      //      if button.isSelected {
      //        if button.currentTitle == "A1" || button.currentTitle == "A2" {
      //          button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
      //          button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
      //        } else {
      //          button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      //          button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
      //        }
      //
      //        for i in 0..<threeSixMovieTheaterView.selectedSeatArr.count {
      //          if threeSixMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
      //            selectedSeatArr.remove(at: i)
      //            threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      //            break
      //          }
      //        }
      //      } else {
      //        if selectedSeatArr.count == 8 {
      //          // 최대 8명까지 선택하실 수 있습니다.
      //          return
      //        }
      //
      //        button.backgroundColor = UIColor.appColor(.megaBoxColor)
      //        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
      //        selectedSeatArr.append(button.currentTitle!)
      //        threeSixMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      //
      //
      //      }
      //      button.isSelected.toggle()
    }
  }
  
  func touchUpThreeSixSelectOkButton(seatNumber: [String], seatCount: Int) {
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
  }
}

extension SelectSeatViewController: EightTwoMovieTheaterViewDelegate {
  func touchUpEightTwoSelectOkButton(seatNumber: [String], seatCount: Int) {
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
  }
  
  func touchUpEightTwoTheaterSeat(_ sender: UIButton) {
    guard let buttonTitle = sender.currentTitle else { return }
    if buttonTitle == "" {
      // 이미 예약된 좌석입니다. (Alert)
    } else {
      // 선택 좌석 표시(보라색 반전 + 상단에 좌석 번호 추가)
      let seatIdx = returnSeatIndex(seatString: buttonTitle, basePlusNum: 8)
      let button = eightTwoMovieTheaterView.seatButtonArr[seatIdx]
      
      if button.isSelected {
        if button.currentTitle == "A3" || button.currentTitle == "A4" {
          button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
          button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        } else {
          button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
        
        for i in 0..<eightTwoMovieTheaterView.selectedSeatArr.count {
          if eightTwoMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
            selectedSeatArr.remove(at: i)
            eightTwoMovieTheaterView.selectedSeatArr = self.selectedSeatArr
            break
          }
        }
      } else {
        if selectedSeatArr.count == 8 {
          // 최대 8명까지 선택하실 수 있습니다.
          return
        }
        
        button.backgroundColor = UIColor.appColor(.megaBoxColor)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        selectedSeatArr.append(button.currentTitle!)
        eightTwoMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      }
      button.isSelected.toggle()
    }
  }
}

extension SelectSeatViewController: OneThreeZeroMovieTheaterViewDelegate {
  func touchUpOneThreeZeroSelectOkButton(seatNumber: [String], seatCount: Int) {
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
  }
  
  func touchUpOneThreeZeroTheaterSeat(_ sender: UIButton) {
    guard let buttonTitle = sender.currentTitle else { return }
    if buttonTitle == "" {
      // 이미 예약된 좌석입니다. (Alert)
    } else {
      // 선택 좌석 표시(보라색 반전 + 상단에 좌석 번호 추가)
      let seatIdx = returnSeatIndex(seatString: buttonTitle, basePlusNum: 8)
      let button = oneThreeZeroMovieTheaterView.seatButtonArr[seatIdx]
      
      if button.isSelected {
        if button.currentTitle == "A3" || button.currentTitle == "A4" {
          button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
          button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        } else {
          button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
        
        for i in 0..<oneThreeZeroMovieTheaterView.selectedSeatArr.count {
          if oneThreeZeroMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
            selectedSeatArr.remove(at: i)
            oneThreeZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
            break
          }
        }
      } else {
        if selectedSeatArr.count == 8 {
          // 최대 8명까지 선택하실 수 있습니다.
          return
        }
        
        button.backgroundColor = UIColor.appColor(.megaBoxColor)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        selectedSeatArr.append(button.currentTitle!)
        oneThreeZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      }
      button.isSelected.toggle()
    }
  }
}

extension SelectSeatViewController: OneFourZeroMovieTheaterViewDelegate {
  func touchUpOneFourZeroSelectOkButton(seatNumber: [String], seatCount: Int) {
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
  }
  
  func touchUpOneFourZeroTheaterSeat(_ sender: UIButton) {
    guard let buttonTitle = sender.currentTitle else { return }
    if buttonTitle == "" {
      // 이미 예약된 좌석입니다. (Alert)
    } else {
      // 선택 좌석 표시(보라색 반전 + 상단에 좌석 번호 추가)
      let seatIdx = returnSeatIndex(seatString: buttonTitle, basePlusNum: 16)
      
      let button = oneFourZeroMovieTheaterView.seatButtonArr[seatIdx]
      
      if button.isSelected {
        if button.currentTitle == "A5" || button.currentTitle == "A6" {
          button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
          button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        } else {
          button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
        
        for i in 0..<oneFourZeroMovieTheaterView.selectedSeatArr.count {
          if oneFourZeroMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
            selectedSeatArr.remove(at: i)
            oneFourZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
            break
          }
        }
      } else {
        if selectedSeatArr.count == 8 {
          // 최대 8명까지 선택하실 수 있습니다.
          return
        }
        
        button.backgroundColor = UIColor.appColor(.megaBoxColor)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        selectedSeatArr.append(button.currentTitle!)
        oneFourZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      }
      button.isSelected.toggle()
    }
  }
}

extension SelectSeatViewController: OneFiveZeroMovieTheaterViewDelegate {
  func touchUpOneFiveZeroSelectOkButton(seatNumber: [String], seatCount: Int) {
    pushReservationSeatData(seatNumber: seatNumber, seatCount: seatCount)
  }
  
  func touchUpOneFiveZeroTheaterSeat(_ sender: UIButton) {
    guard let buttonTitle = sender.currentTitle else { return }
    if buttonTitle == "" {
      // 이미 예약된 좌석입니다. (Alert)
    } else {
      // 선택 좌석 표시(보라색 반전 + 상단에 좌석 번호 추가)
      let seatIdx = returnSeatIndex(seatString: buttonTitle, basePlusNum: 12)
      let button = oneFiveZeroMovieTheaterView.seatButtonArr[seatIdx]
      
      if button.isSelected {
        if button.currentTitle == "A7" || button.currentTitle == "A8" || button.currentTitle == "A9" {
          button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
          button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        } else {
          button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
        
        for i in 0..<oneFiveZeroMovieTheaterView.selectedSeatArr.count {
          if oneFiveZeroMovieTheaterView.selectedSeatArr[i] == button.currentTitle! {
            selectedSeatArr.remove(at: i)
            oneFiveZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
            break
          }
        }
      } else {
        if selectedSeatArr.count == 8 {
          // 최대 8명까지 선택하실 수 있습니다.
          return
        }
        
        button.backgroundColor = UIColor.appColor(.megaBoxColor)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        selectedSeatArr.append(button.currentTitle!)
        oneFiveZeroMovieTheaterView.selectedSeatArr = self.selectedSeatArr
      }
      button.isSelected.toggle()
    }
  }
}
