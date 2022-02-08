//
//  PointVariability.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 08/02/2022.
//

import Foundation
import SwiftUI

class PointVariability: Equatable {
    var xVariable: Double
    var yVariable: Double
    
    init(xVariable: Double, yVariable: Double) {
        self.xVariable = xVariable
        self.yVariable = yVariable
    }
    
    static func == (lhs: PointVariability, rhs: PointVariability) -> Bool {
        return lhs.xVariable == rhs.xVariable && lhs.yVariable == rhs.yVariable
    }
    
    
    // MARK: - Builder Helpers
    
//    static var randomVariability: PointVariability {
//        let randomX = Double.random(in: -50...50)
//        let randomY = Double.random(in: -50...50)
//        return .init(xVariable: randomX, yVariable: randomY)
//    }
//
//    static func randomSetOfVariabilities(for complexity: Int) -> [PointVariability] {
//        (1...6).map { _ in randomVariability }
//    }
    
    static var randomVariability: CGPoint {
        let randomX = Double.random(in: -50...50)
        let randomY = Double.random(in: -50...50)
        return .init(x: randomX, y: randomY)
    }
    
    static func randomSetOfVariabilities(for complexity: Int) -> [CGPoint] {
        (1...6).map { _ in randomVariability }
    }
}
