//
//  Utils.swift
//  SportsStore
//
//  Created by Vladimir Espinola on 11/3/16.
//  Copyright © 2016 Apress. All rights reserved.
//

import Foundation

class Utils {
    class func currencyStringFromNumber(number:Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        return formatter.stringFromNumber(number) ?? ""
    }
}