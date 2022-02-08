//
//  ContentView.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var pointVariabilities: AnimatableVectorVariabilities = AnimatableVectorVariabilities(with: PointVariability.randomSetOfVariabilities(for: 6))
    
    var body: some View {
        VStack {
            Blob(pointVariabilities: pointVariabilities)
                .onTapGesture {
                    let randomComplexity = Int.random(in: 3...8)
                    
                    withAnimation {
                        let newPointVars = AnimatableVectorVariabilities(with: PointVariability.randomSetOfVariabilities(for: randomComplexity))
                        pointVariabilities = newPointVars
                    }
                }
        }
        .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
