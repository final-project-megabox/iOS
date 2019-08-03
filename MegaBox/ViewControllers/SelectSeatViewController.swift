//
//  SelectSeatViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SelectSeatViewController: UIViewController {
  
  var movieTheaterNumber = 0
  var movieData: ReservationData? = nil
  
  let eightTwoMovieTheaterView: EightTwoMovieTheaterView = {
    let view = EightTwoMovieTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    setUpMovieTheaterView(movieTheaterNumber: movieTheaterNumber)
    checkReservationSeat(movieTheaterNumber: movieTheaterNumber)
    
    print(movieData!.seatNumber)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    //    let selectPersonCV = SelectPersonCountViewController()
    //    self.present(selectPersonCV, animated: false)
  }
  
  private func checkReservationSeat(movieTheaterNumber: Int) {
    switch movieTheaterNumber {
    case 36:
      print("")
    case 82:
      guard let movieData = self.movieData else { return }
      for (_, data) in movieData.seatNumber.enumerated() {
        let seatIdx = returnSeatIndex(seatString: data)
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
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("B") {
      for i in seatString {
        if i != "B" {
          resultIdx = Int(String(i))! + (basePlusNum * 1) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("C") {
      for i in seatString {
        if i != "C" {
          resultIdx = Int(String(i))! + (basePlusNum * 2) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("D") {
      for i in seatString {
        if i != "D" {
          resultIdx = Int(String(i))! + (basePlusNum * 3) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("E") {
      for i in seatString {
        if i != "E" {
          resultIdx = Int(String(i))! + (basePlusNum * 4) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("F") {
      for i in seatString {
        if i != "F" {
          resultIdx = Int(String(i))! + (basePlusNum * 5) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("G") {
      for i in seatString {
        if i != "G" {
          resultIdx = Int(String(i))! + (basePlusNum * 6) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("H") {
      for i in seatString {
        if i != "H" {
          resultIdx = Int(String(i))! + (basePlusNum * 7) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("I") {
      for i in seatString {
        if i != "I" {
          resultIdx = Int(String(i))! + (basePlusNum * 8) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("J") {
      for i in seatString {
        if i != "J" {
          resultIdx = Int(String(i))! + (basePlusNum * 9) - 1
          print("\(i) - \(resultIdx)")
        }
      }
    } else if seatString.contains("K") {
      for i in seatString {
        if i != "K" {
          resultIdx = Int(String(i))! + (basePlusNum * 10) - 1
          print("\(i) - \(resultIdx)")
        }
      }
//    } else if seatString.contains("L") {
//      for i in seatString {
//        if i != "L" {
//          resultIdx = Int(String(i))! + (basePlusNum * 11) - 1
//          print("\(i) - \(resultIdx)")
//        }
//      }
//    } else if seatString.contains("M") {
//      for i in seatString {
//        if i != "M" {
//          resultIdx = Int(String(i))! + (basePlusNum * 12) - 1
//          print("\(i) - \(resultIdx)")
//        }
//      }
//    } else {
//      for i in seatString {
//        if i != "N" {
//          resultIdx = Int(String(i))! + (basePlusNum * 13) - 1
//          print("\(i) - \(resultIdx)")
//        }
//      }
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
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    case 82:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    case 130:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    case 140:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    case 150:
      view.addSubview(eightTwoMovieTheaterView)
      eightTwoMovieTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      eightTwoMovieTheaterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      eightTwoMovieTheaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      eightTwoMovieTheaterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    default:
      break
    }
  }
}
