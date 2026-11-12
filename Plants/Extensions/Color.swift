//
//  Color.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI

extension Color {
    init(hex: UInt32) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255
        )
    }

    static let appGreen = Color(red: 0.18, green: 0.55, blue: 0.42)
    static let sheetBackground = Color(red: 0.11, green: 0.11, blue: 0.12)
    static let cardBackground = Color(red: 0.17, green: 0.17, blue: 0.18)
    static let appGray = Color(hex: 0x9F9F91)
    static let pickerValueGray = Color(hex: 0x8E8E93)
    static let tagText = Color(hex: 0xCCC785)
    static let waterTagText = Color(hex: 0xCAF3FB)
}
