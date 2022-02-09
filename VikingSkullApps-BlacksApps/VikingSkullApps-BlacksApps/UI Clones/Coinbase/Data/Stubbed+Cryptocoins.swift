//
//  Stubbed+Cryptocoins.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 09/02/2022.
//

import Foundation

struct Stubbed {}

enum Cryptocoin {
    case bitcoin, etherium, bitcoinCash, dogecoin, achain
    
    var name: String {
        switch self {
        case .bitcoin:
            return "Bitcoin"
        case .etherium:
            return "Etherium"
        case .bitcoinCash:
            return "Bitcoin Cash"
        case .dogecoin:
            return "Dogecoin"
        case .achain:
            return "Achain"
        }
    }
    
    var price: String {
        switch self {
        case .bitcoin:
            return "£32,880.51"
        case .etherium:
            return "£2,402.50"
        case .bitcoinCash:
            return "£254.31"
        case .dogecoin:
            return "£0.12"
        case .achain:
            return "£0.0039"
        }
    }
    
    var ticker: String {
        switch self {
        case .bitcoin:
            return "BTC"
        case .etherium:
            return "ETH"
        case .bitcoinCash:
            return "BCH"
        case .dogecoin:
            return "DOGE"
        case .achain:
            return "ACT"
        }
    }
    
    var differencePercentage: String {
        switch self {
        case .bitcoin:
            return "+2.73%"
        case .etherium:
            return "+5.80%"
        case .bitcoinCash:
            return "+3.54%"
        case .dogecoin:
            return "+2.78%"
        case .achain:
            return "+7.35%"
        }
    }
}

extension Stubbed {
    
}
