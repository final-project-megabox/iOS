//
//  ApiUrl.swift
//  MegaBox
//
//  Created by Fury on 07/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

enum MegaboxApi {
  // Login URL (get Token)
  case loginApi
  // MegaBox Main Posters
  case movieMainPosterApi
  case boxOfficeMovieDataApi
  // Region Data
  case regionDataApi
  // MyPage
  case myPageApi
  // Movie Detail
  case movieDetailApi
  // Event Images
  case eventApi
  // First Reservation Screen (Movie Data)
  case theaterMovieDataApi
  // Push Reservation Data
  case movieReservationDataApi
}

class ApiUrlData {
  static func ApiUrl(_ name: MegaboxApi) -> String {
    switch name {
    case .loginApi:
      let loginURL = "http://megabox.hellocoding.shop//accounts/login/"
      
      return loginURL
      
    case .movieMainPosterApi:
      let randomNum = (0...3).randomElement() ?? 0
      let movieMainPosterArr: [String] = [
        "http://mlink-cdn.netinsight.co.kr/2019/07/30/e8bab8e2554f1fad21a8d4f715912982.jpg|엑시트|입소문 폭발! 유쾌한 재난탈출액션",
        "http://mlink-cdn.netinsight.co.kr/2019/07/15/7c2bb0e7c569751d08d82b71bfd79780.jpg|수상한 교수|조니 뎁의 쿨내 나는 인생 막장 코미디",
        "http://mlink-cdn.netinsight.co.kr/2019/08/05/be6ff169b90711bdb05d62acc535fa8a.jpg|봉오동 전투|독립군 최초의 승리를 확인하세요!",
        "http://mlink-cdn.netinsight.co.kr/2019/07/17/bb608edc6a991f6cb9b43eb994d98693.jpg|47미터 2|수중도시 속 상어때, 극한 서바이벌",
      ]
      
      return movieMainPosterArr[randomNum]
      
    case .boxOfficeMovieDataApi:
      let boxOfficeURL: String = "http://megabox.hellocoding.shop//database/showMovies/"
      return boxOfficeURL
      
    case .regionDataApi:
      let regionURL: String = "http://megabox.hellocoding.shop//database/showregion/"
      return regionURL
      
    case .myPageApi:
      let myPageURL: String = "http://megabox.hellocoding.shop//accounts/myPage/"
      return myPageURL
      
    case .movieDetailApi:
      let movieDetailURL: String = "http://megabox.hellocoding.shop//database/movieDetail/"
      return movieDetailURL
    
      
    case .eventApi:
      let randomNum = (0...2).randomElement() ?? 0
      let eventArr: [String] = [
        "http://image3.megabox.co.kr/mop/event/2019/70/28C8D9-E6DC-4086-AEA6-64BE7CFAD14E.jpg|<브링 더 소울: 더 무비> 응원상영 이벤트|2019.08.10~2019.08.11",
        "http://image3.megabox.co.kr/mop/event/2019/C0/BBA163-E498-485D-8125-F89F7543423A.jpg|메가박스 오리지널 티켓 스페셜|2019.08.07~2019.08.11",
        "http://image3.megabox.co.kr/mop/event/2019/20/BDC56E-D6D8-4AF1-8CD9-89F4FF24EFFB.jpg|신촌, 괴담의 진실..|2019.08.05~2019.08.31",
      ]
      
      return eventArr[randomNum]
      
    case .theaterMovieDataApi:
      let theaterMovieDataURL: String = "http://megabox.hellocoding.shop//database/reservationScheduleList/"
      
      return theaterMovieDataURL
 
    case .movieReservationDataApi:
      let movieReservationDataURL: String = "http://megabox.hellocoding.shop//database/reservationSecond/"
      
      return movieReservationDataURL
    }
  }
}
