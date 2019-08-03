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
  
  let alphbetArr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]
  
  // 영화관 탑(인원수)
  private let totalCountView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let topViewBottomLine: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let previousButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "common_btn_topbar_prev2"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "purpleCancel_icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let totalAdultCountLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let adultTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "일반"
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let totalTeenagerCountLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let teenagerTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "청소년"
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let totalChildCountLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let childTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "어린이"
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  private let totalSeniorCountLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let seniorTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "우대"
    label.textColor = #colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // 영화관
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
    scrollView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    scrollView.showsVerticalScrollIndicator = false
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private let bottomView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // 일반인/일반석
  private let normalView: UIView = {
    let view = UIView()
    view.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    view.layer.borderWidth = 1
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let normalLabel: UILabel = {
    let label = UILabel()
    label.text = "일반석"
    label.labelSetup(text: "일반석", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 13, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // 장애인/휠체어석
  private let disabledView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let disabledLabel: UILabel = {
    let label = UILabel()
    label.labelSetup(text: "장애인/휠체어석", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), fontSize: 13, alignment: .left)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let bottomOfBottomView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let paymentLabel: UILabel = {
    let label = UILabel()
    label.text = "결제금액"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let paymentTotalLabel: UILabel = {
    let label = UILabel()
    label.text = "0원"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let selectOkButton: UIButton = {
    let button = UIButton()
    button.setTitle("선택완료", for: .normal)
    button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    makeSeatButtons()
    setUpProperties()
  }
  
  private func makeSeatButtons() {
    for i in 0..<11 {
      for j in 0..<8 {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(alphbetArr[alphbetIndex])\(j + 1)", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
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
  
  private func setUpProperties() {
    let margin: CGFloat = 10
    
    self.addSubview(scrollView)
    scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    scrollView.addSubview(screenImage)
    screenImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: margin * 15).isActive = true
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
//    thirdView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -margin * 4).isActive = true
    thirdView.widthAnchor.constraint(equalToConstant: 42 * 4).isActive = true
    thirdView.heightAnchor.constraint(equalToConstant: 42 * 5).isActive = true
    

    scrollView.addSubview(fourthView)
    fourthView.topAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 84).isActive = true
    fourthView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40).isActive = true
//    fourthView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -margin * 4).isActive = true
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
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: firstView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          }
        } else if i % 4 == 0 {
          // 4, 12, 20, 28, 36 ...
          if i == 4 {
            frontButtonArr[i].topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: secondView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: secondView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          }
        } else {
          // 그 밖에 좌석
          if i < 8 {
            // 제일 앞좌석
            frontButtonArr[i].topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          }
        }
      } else {
        // 뒷라인 좌석
        if i % 4 == 0 && i % 8 == 0 {
          if i == 48 {
            frontButtonArr[i].topAnchor.constraint(equalTo: thirdView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: thirdView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: thirdView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          }
        } else if i % 4 == 0 {
          // 4, 12, 20, 28, 36 ...
          if i == 52 {
            frontButtonArr[i].topAnchor.constraint(equalTo: fourthView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: fourthView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: fourthView.leadingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          }
        } else {
          // 그 밖에 좌석
          if i < 56 {
            // 제일 앞좌석
            frontButtonArr[i].topAnchor.constraint(equalTo: fourthView.topAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          } else {
            frontButtonArr[i].topAnchor.constraint(equalTo: frontButtonArr[i - 8].bottomAnchor).isActive = true
            frontButtonArr[i].leadingAnchor.constraint(equalTo: frontButtonArr[i - 1].trailingAnchor).isActive = true
            frontButtonArr[i].widthAnchor.constraint(equalToConstant: 35).isActive = true
            frontButtonArr[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
          }
        }
      }
    }
    
    self.addSubview(totalCountView)
    totalCountView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    totalCountView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    totalCountView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    totalCountView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    totalCountView.addSubview(topViewBottomLine)
    topViewBottomLine.leadingAnchor.constraint(equalTo: totalCountView.leadingAnchor).isActive = true
    topViewBottomLine.trailingAnchor.constraint(equalTo: totalCountView.trailingAnchor).isActive = true
    topViewBottomLine.bottomAnchor.constraint(equalTo: totalCountView.bottomAnchor).isActive = true
    topViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    totalCountView.addSubview(previousButton)
    previousButton.topAnchor.constraint(equalTo: totalCountView.topAnchor).isActive = true
    previousButton.leadingAnchor.constraint(equalTo: totalCountView.leadingAnchor).isActive = true
    previousButton.bottomAnchor.constraint(equalTo: totalCountView.bottomAnchor).isActive = true
    previousButton.widthAnchor.constraint(equalTo: totalCountView.widthAnchor, multiplier: 0.1).isActive = true
    
    totalCountView.addSubview(dismissButton)
    dismissButton.topAnchor.constraint(equalTo: totalCountView.topAnchor).isActive = true
    dismissButton.trailingAnchor.constraint(equalTo: totalCountView.trailingAnchor).isActive = true
    dismissButton.bottomAnchor.constraint(equalTo: totalCountView.bottomAnchor).isActive = true
    dismissButton.widthAnchor.constraint(equalTo: totalCountView.widthAnchor, multiplier: 0.1).isActive = true
    
    totalCountView.addSubview(totalAdultCountLabel)
    totalAdultCountLabel.topAnchor.constraint(equalTo: totalCountView.topAnchor).isActive = true
    totalAdultCountLabel.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor).isActive = true
    totalAdultCountLabel.heightAnchor.constraint(equalTo: totalCountView.heightAnchor, multiplier: 0.6).isActive = true
    
    totalCountView.addSubview(adultTitleLabel)
    adultTitleLabel.topAnchor.constraint(equalTo: totalAdultCountLabel.bottomAnchor).isActive = true
    adultTitleLabel.leadingAnchor.constraint(equalTo: totalAdultCountLabel.leadingAnchor).isActive = true
    adultTitleLabel.bottomAnchor.constraint(equalTo: totalCountView.bottomAnchor).isActive = true
    
    totalCountView.addSubview(totalTeenagerCountLabel)
    totalTeenagerCountLabel.topAnchor.constraint(equalTo: totalCountView.topAnchor).isActive = true
    totalTeenagerCountLabel.leadingAnchor.constraint(equalTo: totalAdultCountLabel.trailingAnchor).isActive = true
    totalTeenagerCountLabel.widthAnchor.constraint(equalTo: totalAdultCountLabel.widthAnchor).isActive = true
    totalTeenagerCountLabel.heightAnchor.constraint(equalTo: totalAdultCountLabel.heightAnchor).isActive = true
    
    totalCountView.addSubview(teenagerTitleLabel)
    teenagerTitleLabel.topAnchor.constraint(equalTo: totalTeenagerCountLabel.bottomAnchor).isActive = true
    teenagerTitleLabel.leadingAnchor.constraint(equalTo: adultTitleLabel.trailingAnchor).isActive = true
    teenagerTitleLabel.bottomAnchor.constraint(equalTo: adultTitleLabel.bottomAnchor).isActive = true
    teenagerTitleLabel.widthAnchor.constraint(equalTo: adultTitleLabel.widthAnchor).isActive = true
    
    totalCountView.addSubview(totalChildCountLabel)
    totalChildCountLabel.topAnchor.constraint(equalTo: totalCountView.topAnchor).isActive = true
    totalChildCountLabel.leadingAnchor.constraint(equalTo: totalTeenagerCountLabel.trailingAnchor).isActive = true
    totalChildCountLabel.widthAnchor.constraint(equalTo: totalAdultCountLabel.widthAnchor).isActive = true
    totalChildCountLabel.heightAnchor.constraint(equalTo: totalAdultCountLabel.heightAnchor).isActive = true
    
    totalCountView.addSubview(childTitleLabel)
    childTitleLabel.topAnchor.constraint(equalTo: totalTeenagerCountLabel.bottomAnchor).isActive = true
    childTitleLabel.leadingAnchor.constraint(equalTo: teenagerTitleLabel.trailingAnchor).isActive = true
    childTitleLabel.bottomAnchor.constraint(equalTo: adultTitleLabel.bottomAnchor).isActive = true
    childTitleLabel.widthAnchor.constraint(equalTo: adultTitleLabel.widthAnchor).isActive = true
    
    totalCountView.addSubview(totalSeniorCountLabel)
    totalSeniorCountLabel.topAnchor.constraint(equalTo: totalCountView.topAnchor).isActive = true
    totalSeniorCountLabel.leadingAnchor.constraint(equalTo: totalChildCountLabel.trailingAnchor).isActive = true
    totalSeniorCountLabel.trailingAnchor.constraint(equalTo: dismissButton.leadingAnchor).isActive = true
    totalSeniorCountLabel.widthAnchor.constraint(equalTo: totalAdultCountLabel.widthAnchor).isActive = true
    totalSeniorCountLabel.heightAnchor.constraint(equalTo: totalAdultCountLabel.heightAnchor).isActive = true
    
    totalCountView.addSubview(seniorTitleLabel)
    seniorTitleLabel.topAnchor.constraint(equalTo: totalSeniorCountLabel.bottomAnchor).isActive = true
    seniorTitleLabel.leadingAnchor.constraint(equalTo: childTitleLabel.trailingAnchor).isActive = true
    seniorTitleLabel.trailingAnchor.constraint(equalTo: totalSeniorCountLabel.trailingAnchor).isActive = true
    seniorTitleLabel.bottomAnchor.constraint(equalTo: adultTitleLabel.bottomAnchor).isActive = true
    seniorTitleLabel.widthAnchor.constraint(equalTo: adultTitleLabel.widthAnchor).isActive = true
    
    self.addSubview(bottomView)
    bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    bottomView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    bottomView.addSubview(normalView)
    normalView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: margin).isActive = true
    normalView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: margin).isActive = true
    normalView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    normalView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    bottomView.addSubview(normalLabel)
    normalLabel.centerYAnchor.constraint(equalTo: normalView.centerYAnchor).isActive = true
    normalLabel.leadingAnchor.constraint(equalTo: normalView.trailingAnchor, constant: margin).isActive = true
    normalLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    bottomView.addSubview(disabledView)
    disabledView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: margin).isActive = true
    disabledView.leadingAnchor.constraint(equalTo: normalLabel.trailingAnchor, constant: margin * 2).isActive = true
    disabledView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    disabledView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    bottomView.addSubview(disabledLabel)
    disabledLabel.centerYAnchor.constraint(equalTo: normalView.centerYAnchor).isActive = true
    disabledLabel.leadingAnchor.constraint(equalTo: disabledView.trailingAnchor, constant: margin).isActive = true
    disabledLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    bottomView.addSubview(bottomOfBottomView)
    bottomOfBottomView.topAnchor.constraint(equalTo: normalView.bottomAnchor, constant: margin).isActive = true
    bottomOfBottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    bottomOfBottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    bottomOfBottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    bottomOfBottomView.addSubview(paymentLabel)
    paymentLabel.centerYAnchor.constraint(equalTo: bottomOfBottomView.centerYAnchor).isActive = true
    paymentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
    
    bottomOfBottomView.addSubview(paymentTotalLabel)
    paymentTotalLabel.centerYAnchor.constraint(equalTo: bottomOfBottomView.centerYAnchor).isActive = true
    paymentTotalLabel.leadingAnchor.constraint(equalTo: paymentLabel.trailingAnchor, constant: margin * 2).isActive = true
    
    bottomOfBottomView.addSubview(selectOkButton)
    selectOkButton.topAnchor.constraint(equalTo: bottomOfBottomView.topAnchor).isActive = true
    selectOkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    selectOkButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    selectOkButton.widthAnchor.constraint(equalToConstant: self.frame.width / 3).isActive = true
    
  }
  @objc private func touchUpButton(_ sender: UIButton) {
    sender.setImage(#imageLiteral(resourceName: "booking_seat_select_complete"), for: .normal)
    print(sender.accessibilityIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
