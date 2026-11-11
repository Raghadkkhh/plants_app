//
//  Start.swift
//  Plants
//
//  Created by Raghad Alsnaie on 09/11/2026.
//

import SwiftUI

struct Start: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("My Plants🌱")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.top, 8)
            
            Spacer()
                .frame(height: 70)
            
            Image(.plantPic)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer()
                .frame(height: 37)
            
            VStack(spacing: 8) {
                Text("Start your plant journey!")
                    .font(.title3)
                    .bold()
                
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .font(.body)
                    .foregroundColor(Color(hex: "9F9F91"))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            
            Spacer()
                .frame(height: 105)
            
            Button(action: {
                //action
            }) {
                Text("Set Plant Reminder")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Button_color"))
                    .cornerRadius(160)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1.0)
    }
}

#Preview {
    Start()
        .preferredColorScheme(.dark)
}
