//
//  MyPlantsView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI
import SwiftData

struct MyPlantsView: View {
    @Environment(\.modelContext) private var context
    @Query private var plants: [PlantsData]
    @State private var viewModel = PlantsViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                title
                Divider().overlay(Color.cardBackground)
                content
            }

            addButton
        }
        .sheet(isPresented: $viewModel.showingAddSheet) {
            SetReminderView()
        }
        .sheet(item: $viewModel.plantToEdit) { plant in
            SetReminderView(plant: plant)
        }
    }

    private var title: some View {
        Text("My Plants 🌱")
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state(for: plants) {
        case .empty:
            Spacer()
            HStack {
                Spacer()
                StatusMessageView(
                    imageName: nil,
                    title: nil,
                    message: "No reminders set yet.."
                )
                Spacer()
            }
            Spacer()

        case .allDone:
            Spacer()
            HStack {
                Spacer()
                StatusMessageView(
                    imageName: "Plant_wink_pic",
                    title: "All Done! 🎉",
                    message: "All Reminders Completed"
                )
                Spacer()
            }
            Spacer()

        case .list:
            ProgressHeaderView(
                message: viewModel.headerMessage(for: plants),
                progress: viewModel.progress(for: plants)
            )
            plantsList
        }
    }

    private var plantsList: some View {
        List {
            ForEach(viewModel.sorted(plants)) { plant in
                PlantRowView(plant: plant) {
                    withAnimation {
                        viewModel.toggleWatered(plant)
                    }
                }
                .onTapGesture {
                    viewModel.plantToEdit = plant
                }
                .listRowBackground(Color.black)
                .listRowSeparatorTint(Color.cardBackground)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        viewModel.delete(plant, in: context)
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }

    private var addButton: some View {
        Button {
            viewModel.showingAddSheet = true
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(Color.appGreen, in: Circle())
        }
        .padding(24)
    }
}

#Preview {
    MyPlantsView()
        .modelContainer(for: PlantsData.self, inMemory: true)
}
