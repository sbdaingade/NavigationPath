//
//  NavigationView.swift
//  NavigationPath
//
//  Created by Sachin Daingade on 21/09/25.
//

import SwiftUI
struct NavigationView<Content: View>: View, Hashable {
    @EnvironmentObject var navigationManager: NavigationManager
    var title: String?
    var description: String {
        return title ?? "NA"
    }
    
    var backButtonVisible: Bool = true
    var showConfiramation: Bool = false
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: NavigationView<Content>, rhs: NavigationView<Content>) -> Bool {
        return lhs.title == rhs.title
    }
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content, backButtonVisible: Bool = true, showConfirmation: Bool = false) {
        content = content()
        self.backButtonVisible = backButtonVisible
        self.showConfiramation = showConfirmation
    }
    
    var body: some View {
        if backButtonVisible {
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        backButtonContent()
                    }
                }
        } else {
            
        }
    }
    
    @ViewBuilder
    func backButtonContent() -> some View {
        BackButton {
            navigationManager.navigateBackClicked()
            if !showConfiramation {
                navigationManager.navigateToBack()
            }
        }
    }
}
