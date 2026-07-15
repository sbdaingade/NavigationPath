//
//  ContentView.swift
//  NavigationPath
//
//  Created by Sachin Daingade on 21/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager.shared
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button("Go to Settings") {
                   // navigationManager.navigate(SecondView(),backButtonVisible: true)
                    navigationManager.navigate(SecondView(), pageID: String(describing: SecondView.self),backButtonVisible: true)
                }
            }
            .padding()
            .navigationTitle("Home")
            .navigationDestination(for: NavigationView<AnyView>.self) { destination in
                destination
            }
        }
        .environmentObject(navigationManager)
    }
}

#Preview {
    ContentView()
}
