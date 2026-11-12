//
//  ProgressHeaderView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI

struct ProgressHeaderView: View {
    let message: String
    let progress: Double

    var body: some View {
        VStack(spacing: 12) {
            Text(message)
                .font(.subheadline)
                .foregroundStyle(.white)

            ProgressView(value: progress)
                .tint(Color.appGreen)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}
