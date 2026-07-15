//
//  SecondView.swift
//  NavigationPath
//
//  Created by Sachin Daingade on 12/10/25.
//

import SwiftUI

struct SecondView: View {
    @StateObject var navigationManager = NavigationManager.shared
    @Environment(\.dismiss) var dismiss
    let numberOfCircles: Int = 20
    let radius: CGFloat = 100 // Distance from the center
    let circleSize: CGFloat = 10
    var body: some View {
        ZStack {
            VStack {
                ForEach(0..<numberOfCircles, id: \.self) { index in
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                        .foregroundColor(.blue)
                        .offset(x: radius) // Position the circle along the radius
                        .rotationEffect(.degrees(Double(index) * (360.0 / Double(numberOfCircles)))) // Rotate the circle
                }
            }
        }
        .navigationTitle("First View")
        .environmentObject(navigationManager)
//        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                BackButton {
//                    dismiss()
//                }
//            }
//        }
    }
}

#Preview {
    SecondView()
}
