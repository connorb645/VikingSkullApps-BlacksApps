//
//  AnimatableVectorVariabilities.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 08/02/2022.
//

import Foundation
import UIKit
import SwiftUI

struct AnimatableVectorVariabilities: VectorArithmetic {
    var values: [CGPoint]
    
    init(with values: [CGPoint] = []) {
        self.values = values
        self.magnitudeSquared = 0
        self.recomputeMagnitude()
    }
    
    func computeMagnitude()->Double {
        var sum: Double = 0.0
        
        for index in 0..<values.count {
            sum += Double(values[index].x * values[index].x)
            sum += Double(values[index].y * values[index].y)
        }
        
        return Double(sum)
    }
    
    mutating func recomputeMagnitude(){
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: VectorArithmetic
    var magnitudeSquared: Double // squared magnitude of the vector
    
    mutating func scale(by rhs: Double) {
        // scale vector with a scalar
        // = each value is multiplied by rhs
        for index in 0..<values.count {
            values[index].x *= CGFloat(rhs)
            values[index].y *= CGFloat(rhs)
        }
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: AdditiveArithmetic
    
    // zero is identity element for aditions
    // = all values are zero
    static var zero: AnimatableVectorVariabilities = AnimatableVectorVariabilities()
    
    static func + (lhs: AnimatableVectorVariabilities, rhs: AnimatableVectorVariabilities) -> AnimatableVectorVariabilities {
        var retValues = [CGPoint]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            let x = lhs.values[index].x + rhs.values[index].x
            let y = lhs.values[index].y + rhs.values[index].y
            let new: CGPoint = .init(x: x, y: y)
            retValues.append(new)
        }
        
        return AnimatableVectorVariabilities(with: retValues)
    }
    
    static func += (lhs: inout AnimatableVectorVariabilities, rhs: AnimatableVectorVariabilities) {
        for index in 0..<min(lhs.values.count,rhs.values.count)  {
            lhs.values[index].x += rhs.values[index].x
            lhs.values[index].y += rhs.values[index].y
        }
        lhs.recomputeMagnitude()
    }
    
    static func - (lhs: AnimatableVectorVariabilities, rhs: AnimatableVectorVariabilities) -> AnimatableVectorVariabilities {
        var retValues = [CGPoint]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            let x = lhs.values[index].x - rhs.values[index].x
            let y = lhs.values[index].y - rhs.values[index].y
            let new: CGPoint = .init(x: x, y: y)
            retValues.append(new)
        }
        
        return AnimatableVectorVariabilities(with: retValues)
    }
    
    static func -= (lhs: inout AnimatableVectorVariabilities, rhs: AnimatableVectorVariabilities) {
        for index in 0..<min(lhs.values.count, rhs.values.count)  {
            lhs.values[index].x -= rhs.values[index].x
            lhs.values[index].y -= rhs.values[index].y
        }
        lhs.recomputeMagnitude()
    }
    
}
