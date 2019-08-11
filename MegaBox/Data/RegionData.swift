//
//  RegionData.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

struct RegionData: Codable {
  let id: Int
  let region, theater: String
  let selected: Bool
}

struct AllRegionData {
  let regionNames: [String] = [
    "선호영화관", "서울", "경기", "인천", "대전/충청/세종", "부산/대구/경상",
    "광주/전라", "강원", "제주"
  ]
  
  let region: [String: [String]] = [
    "선호영화관": [
    ],
    
    "서울": [
      "강남", "강남대로(씨티)", "강동", "군자", "동대문",
      "마곡", "목동", "상봉", "상암월드컵경기장", "센트럴",
      "송파파크하비오", "신촌", "은평", "이수", "창동",
      "코엑스", "화곡", "ARTNINE"],
    
    "경기": [
      "고양스타필드", "김포한강신도시", "남양주", "동탄", "미사강변",
      "백석", "별내", "분당", "수원", "수원남문",
      "시흥배곧", "안산중앙", "영통", "오산", "용인테크노밸리",
      "의정부민락", "일산", "일산벨라시타", "킨텍스", "파주금촌",
      "파주운정", "파주출판도시", "평택", "하남스타필드"],
    
    "인천": [
      "검단", "송도", "영종", "인천논현", "청라", "청라지젤"],
    
    "대전/충청/세종": [
      "공주", "대전", "대전중앙로", "세종", "오창", "제천",
      "지천", "천안", "청주충북대", "충주", "홍성내포"],
    
    "부산/대구/경상": [
      "거창", "경산하양", "경주", "구미강동", "김천", "남포항",
      "대구(칠성로)", "대구신세계(동대구)", "대구이시아", "덕천", "마산",
      "문경", "부산극장", "부산대", "북대구(칠곡)", "사천", "삼천포",
      "양산", "양산라피에스타", "울산", "정관", "창원", "해운대(장산)"],
    
    "광주/전라": [
      "광주상무", "광주하남", "남원", "목포", "목포하당(포르모)",
      "송천", "순천", "여수", "여수웅천", "전대(광주)",
      "전주(객사)", "첨단"],
    
    "강원": [
      "남춘천", "속초", "원주", "원주센트럴"],
    
    "제주": [
      "제주"],
  ]
}
