import SwiftUI

class ThemeService: ObservableObject {
    @Published var isDarkModeEnabled: Bool = true
    
    func toggleTheme(isAnimated: Bool = true) {
        if isAnimated {
            withAnimation {
                toggle()
            }
        } else {
            toggle()
        }
        
        func toggle() {
            isDarkModeEnabled.toggle()
        }
    }
    
    var backgroundColor: Color {
        isDarkModeEnabled ? Color.backgroundColorDark : Color.backgroundColorLight
    }
    
    var backgroundOffsetColor: Color {
        isDarkModeEnabled ? Color.backgroundOffsetColorDark : Color.backgroundOffsetColorLight
    }
    
    var foregroundColor: Color {
        isDarkModeEnabled ? Color.foregroundColorDark : Color.foregroundColorLight
    }
    
    var foregroundOffsetColor: Color {
        isDarkModeEnabled ? Color.foregroundOffsetColorDark : Color.foregroundOffsetColorLight
    }
    
    var foregroundSecondaryColor: Color {
        isDarkModeEnabled ? Color.foregroundSecondaryColorDark : Color.foregroundSecondaryColorLight
    }
}
