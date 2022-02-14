//
//  Stubbed+Cryptocoins.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 09/02/2022.
//

import Foundation

struct Faked {}

extension Faked {
    
    static let Cryptocoins: [Cryptocoin] = [
        .init(name: "Bitcoin", price: "£32,880.51", ticker: "BTC", differencePercentage: 2.73),
        .init(name: "Etherium", price: "£2,402.50", ticker: "ETH", differencePercentage: 5.80),
        .init(name: "Bitcoin Cash", price: "£254.31", ticker: "BCH", differencePercentage: -3.54),
        .init(name: "Dogecoin", price: "£0.12", ticker: "DOGE", differencePercentage: -2.78),
        .init(name: "Achain", price: "£0.0039", ticker: "ACT", differencePercentage: 7.35)
    ]
    
}
