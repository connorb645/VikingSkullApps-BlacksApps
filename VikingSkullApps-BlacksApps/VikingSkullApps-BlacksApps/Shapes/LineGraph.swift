//
//  LineGraph.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 13/02/2022.
//

import Foundation

import SwiftUI
import Foundation

struct LineGraph: Shape {
    
        var yPoints: AnimatableVectorGraphYPoints
    
        var animatableData: AnimatableVectorGraphYPoints {
            get { yPoints }
            set { yPoints = newValue }
        }
    
    var smoothness: Double
    
    func path(in rect: CGRect) -> Path {
        
        let allLessThan1 = yPoints.values.allSatisfy { point in
            point <= 1.0
        }
        
        let allGreaterThan0 = yPoints.values.allSatisfy { point in
            point >= 0.0
        }
        
        guard allLessThan1, allGreaterThan0 else { fatalError("All points must be a double from 0.0 to 1.0 representing the percentage of it's y axis") }
        
        let xAxisSpacing = rect.size.width / CGFloat(yPoints.values.count)
        
        let padding = xAxisSpacing / 2
        
        let points: [CGPoint] = yPoints.values.enumerated().map { i, yPercentage in
            let y = rect.size.height - (yPercentage * rect.size.height)
            let x = (CGFloat(i) * xAxisSpacing) + padding
            return .init(x: x, y: y)
        }
        
        return createCurve(from: points, withSmoothness: smoothness)
    }
    
    /// Create UIBezierPath
    ///
    /// - Parameters:
    ///   - points: the points
    ///   - smoothness: the smoothness: 0 - no smooth at all, 1 - maximum smoothness
    private func createCurve(from points: [CGPoint],
                             withSmoothness smoothness: CGFloat,
                             addZeros: Bool = false) -> Path {
        
        var path = Path()
        guard points.count > 0 else { return path }
        var prevPoint: CGPoint = points.first!
        let interval = getXLineInterval()
        if addZeros {
            path.move(to: CGPoint(x: interval.origin.x, y: interval.origin.y))
            path.addLine(to: points[0])
        }
        else {
            path.move(to: points[0])
        }
        for i in 1..<points.count {
            let cp = controlPoints(p1: prevPoint, p2: points[i], smoothness: smoothness)
            path.addCurve(to: points[i], control1: cp.0, control2: cp.1)
            prevPoint = points[i]
        }
        if addZeros {
            path.addLine(to: CGPoint(x: prevPoint.x, y: interval.origin.y))
        }
        return path
    }
    
    /// Create control points with given smoothness
    ///
    /// - Parameters:
    ///   - p1: the first point
    ///   - p2: the second point
    ///   - smoothness: the smoothness: 0 - no smooth at all, 1 - maximum smoothness
    /// - Returns: two control points
    private func controlPoints(p1: CGPoint, p2: CGPoint, smoothness: CGFloat) -> (CGPoint, CGPoint) {
        let cp1: CGPoint!
        let cp2: CGPoint!
        let percent = min(1, max(0, smoothness))
        do {
            var cp = p2
            // Apply smoothness
            let x0 = max(p1.x, p2.x)
            let x1 = min(p1.x, p2.x)
            let x = x0 + (x1 - x0) * percent
            cp.x = x
            cp2 = cp
        }
        do {
            var cp = p1
            // Apply smoothness
            let x0 = min(p1.x, p2.x)
            let x1 = max(p1.x, p2.x)
            let x = x0 + (x1 - x0) * percent
            cp.x = x
            cp1 = cp
        }
        return (cp1, cp2)
    }
    
    /// Defines interval width, height (not used in this example) and coordinate of the first interval.
    /// - Returns: (x0, y0, step, height)
    internal func getXLineInterval() -> CGRect {
        return CGRect.zero
    }
}
