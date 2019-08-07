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
        
        let url = URL(string: moviePosterUrl)!
        
        do {
          let moviePosterData = try Data(contentsOf: url)
          let mainVC = MainViewController()
          mainVC.allMovieData = data
          mainVC.mainPosterImageData = moviePosterData
          mainVC.mainPosterTitleStr = moviePosterTitle
          mainVC.mainPosterSubTitleStr = moviePosterSubTitle
          self.present(mainVC, animated: false)
        } catch {
          print("[Error Log] :", error.localizedDescription)
        }
      case .failure(let err):
        print(err)
      }
    }
    
  }
}
