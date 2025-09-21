//
//  BackButton.swift
//  NavigationPath
//
//  Created by Sachin Daingade on 21/09/25.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: {
        }) {
            Text("Back")
        }
    }
}
