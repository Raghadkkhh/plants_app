//
//  SetReminderView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI
import SwiftData

struct SetReminderView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var viewModel: PlantFormViewModel

    init(plant: PlantsData? = nil) {
        _viewModel = State(initialValue: PlantFormViewModel(plant: plant))
    }

    var body: some View {
        ZStack {
            Color.sheetBackground.ignoresSafeArea()

            VStack(spacing: 20) {
                header
                nameField
                roomAndLightCard
                wateringCard

                if viewModel.isEditing {
                    deleteButton
                }

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .preferredColorScheme(.dark)
    }

    private var header: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.cardBackground, in: Circle())
            }

            Spacer()

            Text("Set Reminder")
                .font(.headline)
                .foregroundStyle(.white)

            Spacer()

            Button {
                viewModel.save(in: context)
                dismiss()
            } label: {
                Image(systemName: "checkmark")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.appGreen, in: Circle())
            }
            .disabled(!viewModel.isValid)
            .opacity(viewModel.isValid ? 1 : 0.4)
        }
    }

    private var nameField: some View {
        HStack {
            Text("Plant Name")
                .foregroundStyle(.white)

            TextField("", text: $viewModel.plantName, prompt: Text("Pothos").foregroundStyle(.gray))
                .tint(.appGreen)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 24))
    }

    private var roomAndLightCard: some View {
        VStack(spacing: 0) {
            FormPickerRow(
                title: "Room",
                icon: "location",
                selection: $viewModel.room,
                options: Room.allCases
            )
            Divider()
            FormPickerRow(
                title: "Light",
                icon: "sun.max",
                selection: $viewModel.light,
                options: LightLevel.allCases
            )
        }
        .padding(.horizontal, 16)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 24))
    }

    private var wateringCard: some View {
        VStack(spacing: 0) {
            FormPickerRow(
                title: "Watering Days",
                icon: "drop",
                selection: $viewModel.wateringFrequency,
                options: WateringFrequency.allCases
            )
            Divider()
            FormPickerRow(
                title: "Water",
                icon: "drop",
                selection: $viewModel.waterAmount,
                options: WaterAmount.allCases
            )
        }
        .padding(.horizontal, 16)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 24))
    }

    private var deleteButton: some View {
        Button {
            viewModel.delete(in: context)
            dismiss()
        } label: {
            Text("Delete Reminder")
                .foregroundStyle(.red)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 24))
        }
    }
}

#Preview {
    SetReminderView()
        .modelContainer(for: PlantsData.self, inMemory: true)
}
