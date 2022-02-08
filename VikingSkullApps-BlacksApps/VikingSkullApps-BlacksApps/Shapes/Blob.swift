//
//  Blob.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 08/02/2022.
//

import SwiftUI
import Foundation

struct Blob: Shape {
    
    var pointVariabilities: AnimatableVectorVariabilities
    
    var animatableData: AnimatableVectorVariabilities {
        get { pointVariabilities }
        set { pointVariabilities = newValue }
    }
        
    func path(in rect: CGRect) -> Path {
        
        let drawingHelper = DrawingHelper()
                
        let controlPoints = drawingHelper.createControlPoints(with: pointVariabilities.values,
                                                              inside: rect)
                        
        guard let path = drawingHelper.catmullThisFucker(catmullRomInterpolatedPoints: controlPoints,
                                                         closed: true,
                                                         alpha: 1.0) else {
            fatalError()
        }
        
        return path
        
    }
}
