//
//  StatusMessageView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI

struct StatusMessageView: View {
    let imageName: String?
    let title: String?
    let message: String

    var body: some View {
        VStack(spacing: 12) {
            if let imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
            }

            if let title {
                Text(title)
                    .font(.title3.bold())
                    .foregroundStyle(.white)
            }

            Text(message)
                .font(.subheadline)
                .foregroundStyle(Color.appGray)
        }
    }
}
