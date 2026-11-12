//
//  TagView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI

struct TagView: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.caption)
        .foregroundStyle(color)
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(Color.cardBackground, in: Capsule())
    }
}
