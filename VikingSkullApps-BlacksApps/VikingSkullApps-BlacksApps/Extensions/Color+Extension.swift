import SwiftUI

extension Color {
    static var backgroundColorLight = Color(hex: 0xEEEEED)
    static var backgroundColorDark = Color(hex: 0x191919)
    static var backgroundOffsetColorLight = Color(hex: 0xFFFFFF)
    static var backgroundOffsetColorDark = Color(hex: 0x2B2B2B)
    static var foregroundColorLight = Color(hex: 0x2A2B2B)
    static var foregroundColorDark = Color(hex: 0xEDEDED)
    static var foregroundOffsetColorLight = Color(hex: 0x202023)
    static var foregroundOffsetColorDark = Color(hex: 0xDFDFDF)
    static var foregroundSecondaryColorLight = Color(hex: 0x4A4A51)
    static var foregroundSecondaryColorDark = Color(hex: 0x454545)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
