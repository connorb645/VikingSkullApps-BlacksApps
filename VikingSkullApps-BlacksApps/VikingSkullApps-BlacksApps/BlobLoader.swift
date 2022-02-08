//
//  BlobLoader.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 08/02/2022.
//

import SwiftUI

struct BlobLoader: View {
    
    @StateObject var blobOneObservable = BlobLoaderObservable(topGradientColor: .indigo,
                                                              bottomGradientColor: .purple,
                                                              variabilityStrength: .medium)
    @StateObject var blobTwoObservable = BlobLoaderObservable(topGradientColor: .yellow,
                                                              bottomGradientColor: .green,
                                                              variabilityStrength: .low)
    @StateObject var blobThreeObservable = BlobLoaderObservable(topGradientColor: .blue,
                                                                bottomGradientColor: .red,
                                                                variabilityStrength: .low)
    @StateObject var blobFourObservable = BlobLoaderObservable(topGradientColor: .black,
                                                               bottomGradientColor: .black,
                                                               complexity: 4,
                                                               duration: 6,
                                                               variabilityStrength: .superLow)
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Blob(pointVariabilities: blobOneObservable.pointVariabilities)
                    .fill(blobOneObservable.gradient)
                    .onReceive(blobOneObservable.timer) { _ in
                        blobOneObservable.updateBlob()
                    }
                
                Blob(pointVariabilities: blobTwoObservable.pointVariabilities)
                    .fill(blobTwoObservable.gradient)
                    .onReceive(blobTwoObservable.timer) { _ in
                        blobTwoObservable.updateBlob()
                    }
                    .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.75)
                
                Blob(pointVariabilities: blobThreeObservable.pointVariabilities)
                    .fill(blobThreeObservable.gradient)
                    .onReceive(blobThreeObservable.timer) { _ in
                        blobThreeObservable.updateBlob()
                    }
                    .frame(width: proxy.size.width * 0.5, height: proxy.size.height * 0.5)
                
                Blob(pointVariabilities: blobFourObservable.pointVariabilities)
                    .fill(blobFourObservable.gradient)
                    .onReceive(blobFourObservable.timer) { _ in
                        blobFourObservable.updateBlob()
                    }
                    .frame(width: proxy.size.width * 0.4, height: proxy.size.height * 0.4)
                
                Text("Loading...")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}

struct BlobLoader_Previews: PreviewProvider {
    static var previews: some View {
        BlobLoader()
    }
}
