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
    
    static func randomVariability(strength: VariabilityStrength = .low) -> CGPoint {
        let randomX = Double.random(in: strength.lowerBound...strength.upperBound)
        let randomY = Double.random(in: strength.lowerBound...strength.upperBound)
        return .init(x: randomX, y: randomY)
    }
    
    static func randomSetOfVariabilities(for complexity: Int, strength: VariabilityStrength = .low) -> [CGPoint] {
        (1...complexity).map { _ in randomVariability(strength: strength) }
    }
}

enum VariabilityStrength {
    case superLow, low, medium, high
    
    var lowerBound: Double {
        switch self {
        case .superLow:
            return -2
        case .low:
            return -10
        case .medium:
            return -25
        case .high:
            return -35
        }
    }
    
    var upperBound: Double {
        switch self {
        case .superLow:
            return 2
        case .low:
            return 10
        case .medium:
            return 25
        case .high:
            return 35
        }
    }
}
