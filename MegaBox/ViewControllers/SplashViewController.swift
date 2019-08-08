//
//  SplashViewController.swift
//  MegaBox
//
//  Created by Fury on 22/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

  // MARK:- Properties
  private let shared = MovieDataManager.shared
  
  private var timer: Timer!
  
  // MARK:- Life Cycle
  // MARK: viewDidLoad()
  override func viewDidLoad() {
    super.viewDidLoad()

    timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(startSplash), userInfo: nil, repeats: false)
  }
  
  // MARK:- Methods
  // MARK: startSplash()
  @objc private func startSplash() {
    let boxOfficeMovieDataUrl = ApiUrlData.ApiUrl(.boxOfficeMovieDataApi)
    
    NetworkService.getAllMovieData(boxOfficeMovieDataUrl) { result in
      switch result {
      case .success(let data):
        self.shared.allMovieData = data
        self.shared.sortedAllMovieTitle = data.map({ $0.title })
        
        let moviePosterData = ApiUrlData.ApiUrl(.movieMainPosterApi).split(separator: "|")
        let moviePosterUrl = String(moviePosterData[0])
        let moviePosterTitle = String(moviePosterData[1])
        let moviePosterSubTitle = String(moviePosterData[2])
        
        let eventData = ApiUrlData.ApiUrl(.eventApi).split(separator: "|")
        let eventDataUrl = String(eventData[0])
        let eventDataTitle = String(eventData[1])
        let eventDataSubTitle = String(eventData[2])
        
        let moviePosterURL = URL(string: moviePosterUrl)!
        let eventDataURL = URL(string: eventDataUrl)!
        
        let mainVC = MainViewController()
        
        do {
          let moviePosterData = try Data(contentsOf: moviePosterURL)
          mainVC.allMovieData = data
          mainVC.mainPosterImageData = moviePosterData
          mainVC.mainPosterTitleStr = moviePosterTitle
          mainVC.mainPosterSubTitleStr = moviePosterSubTitle
        } catch {
          print("[Error Log] :", error.localizedDescription)
        }
        
        do {
          let eventData = try Data(contentsOf: eventDataURL)
          mainVC.eventImageData = eventData
          mainVC.eventTitleStr = eventDataTitle
          mainVC.eventSubTitleStr = eventDataSubTitle
        } catch {
          print("[Error Log] :", error.localizedDescription)
        }
        
        self.present(mainVC, animated: false)
      case .failure(let err):
        print(err)
      }
    }
    
  }
}
