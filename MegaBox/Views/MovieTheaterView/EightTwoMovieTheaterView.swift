//
//  EightTwoMovieTheater.swift
//  MegaBox
//
//  Created by Fury on 30/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class EightTwoMovieTheaterView: UIView {
  
  var alphbetIndex = 0
  private var frontButtonArr: [UIButton] = []
  
  private let screenImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "seat_select_image_screen")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let firstView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let secondView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let thirdView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let fourthView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  let alphbetArr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    makeSeatButtons()
    setupSeatButtons()
  }
  
  private func makeSeatButtons() {
    for i in 0..<11 {
      for j in 0..<8 {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(alphbetArr[alphbetIndex])\(j + 1)", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.accessibilityIdentifier = "\(alphbetArr[alphbetIndex])\((j + 1))"
        button.addTarget(self, action: #selector(touchUpButton(_:)), for: .touchUpInside)
        
        if j == 7 {
          alphbetIndex += 1
        }
        
        if i < 6 {
          if j < 4 {
            firstView.addSubview(button)
          } else {
            secondView.addSubview(button)
          }
        } else {
          if j < 4 {
            thirdView.addSubview(button)
          } else {
            fourthView.addSubview(button)
          }
        }
        frontButtonArr.append(button)
      }
    }
  }
  
  private func setupSeatButtons() {
    self.addSubview(scrollView)
    scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    scrollView.addSubview(screenImage)
    screenImage.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    screenImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
    screenImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    screenImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    screenImage.widthAnchor.constraint(equalToConstant: 500).isActive = true
    screenImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    scrollView.addSubview(firstView)
    firstView.topAnchor.constraint(equalTo: screenImage.bottomAnchor, constant: 80).isActive = true
    firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
    firstView.widthAnchor.constraint(equalToConstant: 42 * 4).isActive = true
    firstView.heightAnchor.constraint(equalToConstant: 42 * 6).isActive = true
    
    scrollView.addSubview(secondView)
    secondView.topAnchor.constraint(equalTo: screenImage.bottomAnchor, constant: 80).isActive = true
    secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40).isActive = true
    secondView.widthAnchor.constraint(equalToConstant: 42 * 4).isActive = true
    secondView.heightAnchor.constraint(equalToConstant: 42 * 6).isActive = true
    
    
    scrollView.addSubview(thirdView)
    thirdView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 84).isActive = true
    thirdView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
    thirdView.widthAnchor.constraint(equalToConstant: 42 * 4).isActive = true
    thirdView.heightAnchor.constraint(equalToConstant: 42 * 5).isActive = true
    
    scrollView.addSubview(fourthView)
    fourthView.topAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 84).isActive = true
    fourthView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40).isActive = true
    fourthView.widthAnchor.constraint(equalToConstant: 42 * 4).isActive = true
    fourthView.heightAnchor.constraint(equalToConstant: 42 * 5).isActive = true
    
    for i in 0..<frontButtonArr.count {
      if i < 48 {
        // 앞라인 좌석
        if i % 4 == 0 && i % 8 == 0 {
          // 0, 8, 16, 24, 32 ...
          if i == 0 {
            // 제일 왼쪽 상단 (0,0)
            frontButtonArr[i].topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: firstView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor, constant: 2).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: firstView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          }
        } else if i % 4 == 0 {
          // 4, 12, 20, 28, 36 ...
          if i == 4 {
            frontButtonArr[i].topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: secondView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor, constant: 2).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: secondView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          }
        } else {
          // 그 밖에 좌석
          if i < 8 {
            // 제일 앞좌석
            frontButtonArr[i].topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor, constant: 2).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          }
        }
      } else {
        // 뒷라인 좌석
        if i % 4 == 0 && i % 8 == 0 {
          if i == 48 {
            frontButtonArr[i].topAnchor.constraint(equalTo: thirdView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: thirdView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor, constant: 2).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: thirdView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          }
        } else if i % 4 == 0 {
          // 4, 12, 20, 28, 36 ...
          if i == 52 {
            frontButtonArr[i].topAnchor.constraint(equalTo: fourthView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: fourthView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor, constant: 2).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: fourthView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          }
        } else {
          // 그 밖에 좌석
          if i < 56 {
            // 제일 앞좌석
            frontButtonArr[i].topAnchor.constraint(equalTo: fourthView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor, constant: 2).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 40).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
          }
        }
      }
    }
  }
  @objc private func touchUpButton(_ sender: UIButton) {
    sender.setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
    print(sender.accessibilityIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
