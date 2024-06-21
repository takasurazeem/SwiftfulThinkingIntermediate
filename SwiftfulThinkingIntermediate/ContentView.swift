//
//  ContentView.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Takasur Azeem on 21/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    LongPressGestureBootcamp()
                } label: {
                    Text("LongPressGestureBootcamp")
                }
            }
            .navigationTitle("Swiftful - Intermediate")
        }
    }
}

#Preview {
    ContentView()
}
