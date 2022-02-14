//
//  VikingSkullApps_BlacksAppsApp.swift
//  VikingSkullApps-BlacksApps
//
//  Created by Connor Black on 07/02/2022.
//

import SwiftUI

@main
struct VikingSkullApps_BlacksAppsApp: App {
    
    @StateObject var themeService = ThemeService()
    
    var body: some Scene {
        WindowGroup {
            CoinbaseScreenView()
                .environmentObject(themeService)
        }
    }
}
