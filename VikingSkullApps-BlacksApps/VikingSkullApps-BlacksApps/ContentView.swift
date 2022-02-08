//
//  ContentView.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 07/02/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
        
    var body: some View {
        ZStack {
            Color.black.opacity(0.95)
                .ignoresSafeArea()
            
            ZStack {
                BlobLoader()
            }
            .frame(width: 250, height: 250)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
