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
                                                              variabilityStrength: .high)
    @StateObject var blobTwoObservable = BlobLoaderObservable(topGradientColor: .yellow,
                                                              bottomGradientColor: .green,
                                                              variabilityStrength: .medium)
    @StateObject var blobThreeObservable = BlobLoaderObservable(topGradientColor: .blue,
                                                                bottomGradientColor: .red,
                                                                variabilityStrength: .low)
    @StateObject var blobFourObservable = BlobLoaderObservable(topGradientColor: .black,
                                                               bottomGradientColor: .black,
                                                               complexity: 8,
                                                               duration: 2,
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
                    .frame(width: proxy.size.width * 0.9, height: proxy.size.height * 0.9)
                
                Blob(pointVariabilities: blobThreeObservable.pointVariabilities)
                    .fill(blobThreeObservable.gradient)
                    .onReceive(blobThreeObservable.timer) { _ in
                        blobThreeObservable.updateBlob()
                    }
                    .frame(width: proxy.size.width * 0.8, height: proxy.size.height * 0.8)
                
                
                // Hey Ben, You want to code this last blob, and the text loading view.
                
                // When coding it, maybe pin the ContentView preview. This way you'll get the black background in the preview editor for the timelapse.
                
                Blob(pointVariabilities: blobFourObservable.pointVariabilities)
                    .fill(blobFourObservable.gradient)
                    .onReceive(blobFourObservable.timer) { _ in
                        blobFourObservable.updateBlob()
                    }
                    .frame(width: proxy.size.width * 0.65, height: proxy.size.height * 0.65)
                
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
