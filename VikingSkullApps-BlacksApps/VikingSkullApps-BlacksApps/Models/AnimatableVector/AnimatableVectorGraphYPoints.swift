//
//  AnimatableVectorGraphYPoints.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 13/02/2022.
//

import Foundation
import UIKit
import SwiftUI

struct AnimatableVectorGraphYPoints: VectorArithmetic {
    var values: [Double]
    
    init(with values: [Double] = []) {
        self.values = values
        self.magnitudeSquared = 0
        self.recomputeMagnitude()
    }
    
    func computeMagnitude() -> Double {
        var sum: Double = 0.0
        
        for index in 0..<values.count {
            sum += values[index]
        }
        
        return Double(sum)
    }
    
    mutating func recomputeMagnitude(){
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: VectorArithmetic
    var magnitudeSquared: Double
    
    mutating func scale(by rhs: Double) {
        for index in 0..<values.count {
            values[index] *= CGFloat(rhs)
        }
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: AdditiveArithmetic
    static var zero: AnimatableVectorGraphYPoints = AnimatableVectorGraphYPoints()
    
    static func + (lhs: AnimatableVectorGraphYPoints, rhs: AnimatableVectorGraphYPoints) -> AnimatableVectorGraphYPoints {
        var retValues = [Double]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            retValues.append(lhs.values[index] + rhs.values[index])
        }
        
        return AnimatableVectorGraphYPoints(with: retValues)
    }
    
    static func += (lhs: inout AnimatableVectorGraphYPoints, rhs: AnimatableVectorGraphYPoints) {
        for index in 0..<min(lhs.values.count,rhs.values.count)  {
            lhs.values[index] += rhs.values[index]
        }
        lhs.recomputeMagnitude()
    }
    
    static func - (lhs: AnimatableVectorGraphYPoints, rhs: AnimatableVectorGraphYPoints) -> AnimatableVectorGraphYPoints {
        var retValues = [Double]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            retValues.append(lhs.values[index] - rhs.values[index])
        }
        
        return AnimatableVectorGraphYPoints(with: retValues)
    }
    
    static func -= (lhs: inout AnimatableVectorGraphYPoints, rhs: AnimatableVectorGraphYPoints) {
        for index in 0..<min(lhs.values.count, rhs.values.count)  {
            lhs.values[index] -= rhs.values[index]
        }
        lhs.recomputeMagnitude()
    }
    
}
