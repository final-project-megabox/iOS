//
//  SelectSeatViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectSeatViewController: UIViewController {
  
  var timer: Timer!
  
  var movieTheaterNumber = 0
  
  var movieData: ReservationData? = nil
  
  var selectedSeatArr: [String] = []

  var selectPersonCountData: ReservationPersonCount?
  
  
  let eightTwoMovieTheaterView: EightTwoMovieTheaterView = {
    let view = EightTwoMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    eightTwoMovieTheaterView.delegate = self
    
    setUpMovieTheaterView(movieTheaterNumber: movieTheaterNumber)
    checkReservationSeat(movieTheaterNumber: movieTheaterNumber)
    
    timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(startSplash), userInfo: nil, repeats: false)
  }
  
  private func changeCountValues(movieTheaterNumber: Int) {
    switch movieTheaterNumber {
    case 36:
      print("")
    case 82:
      eightTwoMovieTheaterView.adultCount = selectPersonCountData?.adultCount ?? 0
      eightTwoMovieTheaterView.teenagerCount = selectPersonCountData?.teenagerCount ?? 0
      eightTwoMovieTheaterView.childCount = selectPersonCountData?.childCount ?? 0
      eightTwoMovieTheaterView.seniorCount = selectPersonCountData?.seniorCount ?? 0
    case 130:
      print("")
    case 140:
      print("")
    case 150:
      print("")
    default:
      break
    }
  }
  
  @objc private func startSplash() {
    let selectPersonCountVC = SelectPersonCountViewController()
    selectPersonCountVC.modalPresentationStyle = .overCurrentContext
    selectPersonCountVC.modalTransitionStyle = .flipHorizontal
    present(selectPersonCountVC, animated: false)
  }
  
  private func checkReservationSeat(movieTheaterNumber: Int) {
    switch movieTheaterNumber {
    case 36:
      print("")
    case 82:
      guard let movieData = self.movieData else { return }
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data)
        eightTwoMovieTheaterView.seatButtonArr[seatIdx].setTitle("", for: .normal)
        eightTwoMovieTheaterView.seatButtonArr[seatIdx].setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
      }
    case 130:
      print("")
    case 140:
      print("")
    case 150:
      print("")
    default:
      break
    }
  }
  
  private func returnSeatIndex(seatString: String) -> Int {
    var resultIdx = 0
    let basePlusNum = 8
    
    if seatString.contains("A") {
      for i in seatString {
        if i != "A" {
          resultIdx = Int(String(i))! - 1
        }
      }
    } else if seatString.contains("B") {
      for i in seatString {
        if i != "B" {
          resultIdx = Int(String(i))! + (basePlusNum * 1) - 1
        }
      }
    } else if seatString.contains("C") {
      for i in seatString {
        if i != "C" {
          resultIdx = Int(String(i))! + (basePlusNum * 2) - 1
        }
      }
    } else if seatString.contains("D") {
      for i in seatString {
        if i != "D" {
          resultIdx = Int(String(i))! + (basePlusNum * 3) - 1
        }
      }
    } else if seatString.contains("E") {
      for i in seatString {
        if i != "E" {
          resultIdx = Int(String(i))! + (basePlusNum * 4) - 1
        }
      }
    } else if seatString.contains("F") {
      for i in seatString {
        if i != "F" {
          resultIdx = Int(String(i))! + (basePlusNum * 5) - 1
        }
      }
    } else if seatString.contains("G") {
      for i in seatString {
        if i != "G" {
          resultIdx = Int(String(i))! + (basePlusNum * 6) - 1
        }
      }
    } else if seatString.contains("H") {
      for i in seatString {
        if i != "H" {
          resultIdx = Int(String(i))! + (basePlusNum * 7) - 1
        }
      }
    } else if seatString.contains("I") {
      for i in seatString {
        if i != "I" {
          resultIdx = Int(String(i))! + (basePlusNum * 8) - 1
        }
      }
    } else if seatString.contains("J") {
      for i in seatString {
        if i != "J" {
          resultIdx = Int(String(i))! + (basePlusNum * 9) - 1
        }
      }
    } else if seatString.contains("K") {
      for i in seatString {
        if i != "K" {
          resultIdx = Int(String(i))! + (basePlusNum * 10) - 1
        }
      }
    } else if seatString.contains("L") {
      for i in seatString {
        if i != "L" {
          resultIdx = Int(String(i))! + (basePlusNum * 11) - 1
        }
      }
    } else if seatString.contains("M") {
      for i in seatString {
        if i != "M" {
          resultIdx = Int(String(i))! + (basePlusNum * 12) - 1
        }
      }
    } else {
      for i in seatString {
        if i != "N" {
          resultIdx = Int(String(i))! + (basePlusNum * 13) - 1
        }
      }
    }
    return resultIdx
  }
  
  private func setUpMovieTheaterView(movieTheaterNumber: Int) {
    let guide = view.safeAreaLayoutGuide
    
    switch movieTheaterNumber {
    case 36:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 82:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 130:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 140:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    case 150:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    default:
      break
    }
  }
}

extension SelectSeatViewController: EightTwoMovieTheaterViewDelegate {
  func touchUpTheaterSeat(_ sender: UIButton) {
    guard let buttonTitle = sender.currentTitle else { return }
    if buttonTitle == "" {
      // 이미 예약된 좌석입니다. (Alert)
    } else {
      // 선택 좌석 표시(보라색 반전 + 상단에 좌석 번호 추가)
      let seatIdx = returnSeatIndex(seatString: buttonTitle)
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
