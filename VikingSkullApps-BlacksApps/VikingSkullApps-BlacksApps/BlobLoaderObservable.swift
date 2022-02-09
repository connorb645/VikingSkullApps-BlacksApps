//
//  BlobLoaderObservable.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 08/02/2022.
//

import Foundation
import SwiftUI
import Combine

class BlobLoaderObservable: ObservableObject {
    
    @Published var pointVariabilities: AnimatableVectorVariabilities!
    
    let gradient: LinearGradient
    let animation: Animation
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let complexity: Int
    let variabilityStrength: VariabilityStrength
    
    init(topGradientColor: Color,
         bottomGradientColor: Color,
         complexity: Int = 5,
         duration: Double = 0.75,
         variabilityStrength: VariabilityStrength = .medium) {
        
        self.variabilityStrength = variabilityStrength
        self.complexity = complexity
        self.animation = Animation.linear(duration: duration)
        self.gradient = .init(gradient: .init(colors: [topGradientColor, bottomGradientColor]),
                              startPoint: .top,
                              endPoint: .bottom)
        self.timer = Timer.publish(every: duration,
                                   on: .main,
                                   in: .common).autoconnect()
        updateBlob()
    }
    
    func updateBlob() {
        withAnimation(animation) {
            let randomVariabilities = PointVariability.randomSetOfVariabilities(for: complexity,
                                                                                strength: variabilityStrength)
            let newPointVars = AnimatableVectorVariabilities(with: randomVariabilities)
            pointVariabilities = newPointVars
        }
    }
    
}
