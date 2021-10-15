//
//  Helper.swift
//  TigerFit
//
//  Created by Kyla Wilson on 4/7/21.
//

import Foundation

func GetEatingTime() -> String {
    let hour = Calendar.current.component(.hour, from: Date())

    switch hour {
    case 6..<12 :
        return "Breakfast"
    case 12 :
        return "Lunch"
    case 13..<17 :
        return "Snack"
    default:
        return "Dinner"
    }
}
