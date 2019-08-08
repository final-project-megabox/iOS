//
//  Trade.swift
//  MegaBox
//
//  Created by Fury on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation




enum PersonType: String {
  case Normal
  case Youth
  case Favor
}

enum Trade {
  case Select(personType: PersonType, amount: Int, theaterType: TheaterType)
  case Cancel(personType: PersonType, amount: Int, theaterType: TheaterType)
}

func trade(type: Trade) {}
