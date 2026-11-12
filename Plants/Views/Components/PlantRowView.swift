//
//  PlantRowView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI

struct PlantRowView: View {
    let plant: PlantsData
    let onToggle: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Button(action: onToggle) {
                Image(systemName: plant.plantIsWatered ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(plant.plantIsWatered ? Color.appGreen : .gray)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 6) {
                Label("in \(plant.plantRoom.rawValue)", systemImage: "location")
                    .font(.caption)
                    .foregroundStyle(.gray)

                Text(plant.plantName)
                    .font(.title2)
                    .foregroundStyle(plant.plantIsWatered ? .gray : .white)

                HStack(spacing: 8) {
                    TagView(
                        icon: plant.plantLight.icon,
                        text: plant.plantLight.rawValue,
                        color: Color.tagText
                    )
                    TagView(
                        icon: "drop",
                        text: plant.plantWaterAmount.rawValue,
                        color: Color.waterTagText
                    )
                }
            }

            Spacer()
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}
