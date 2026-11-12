//
//  FormPickerRow.swift
//  Plants
//
//  Created by Raghad Alsnaie on 12/11/2026.
//

import SwiftUI

struct FormPickerRow<Option: Hashable & RawRepresentable>: View where Option.RawValue == String {
    let title: String
    let icon: String
    @Binding var selection: Option
    let options: [Option]

    var body: some View {
        HStack {
            Label(title, systemImage: icon)
                .foregroundStyle(.white)

            Spacer()

            Menu {
                Picker(title, selection: $selection) {
                    ForEach(options, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Text(selection.rawValue)
                        .foregroundStyle(Color.pickerValueGray)
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.caption2)
                        .foregroundStyle(Color.pickerValueGray)
                }
            }
            .tint(Color.pickerValueGray)
        }
        .padding(.vertical, 10)
    }
}
