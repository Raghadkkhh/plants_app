//
//  ContentView.swift
//  Plants
//
//  Created by Raghad Alsnaie on 09/11/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var  plants: [PlantsData]
    var body: some View {
        if plants.isEmpty{
            Start()
        }else{
            
        }
            
    }
}

#Preview {
    ContentView()
}


