//
//  NavigationManager.swift
//  NavigationPath
//
//  Created by Sachin Daingade on 21/09/25.
//
import Combine
import Foundation
import SwiftUI

public final class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    @Published var clickedBackButton: Bool = false
    var pathID: [String] = []
    var backButtonVisible: Bool = false
    public static let shared = NavigationManager()
    
    public func navigate(_ page: some View, pageID: String, backButtonVisible: Bool = true, showConfirmation: Bool = false) {
        pathID.append(pageID)
        path.append(NavigationView(content: {
            AnyView(page)
        }, backButtonVisible: backButtonVisible, showConfirmation: showConfirmation))
        clickedBackButton = false
    }
    
    func navigateBackClicked() {
        clickedBackButton = true
    }
    func navigateBackReset() {
        clickedBackButton = false
    }
    func navigateToBack() {
        if !path.isEmpty {
            path.removeLast()
        }
        if !pathID.isEmpty {
            pathID.removeLast()
        }
    }
    
    func popToRoot() {
        path = NavigationPath()
        pathID = []
    }
    
    public func navigateTo(_ identifier: String) {
        guard let viewIndex = indexForView(withID: identifier) else {
        debugPrint("identifier \(identifier) not found. you are trying to navigate to a view that is not in the stack")
            return
        }
        pathID.removeLast(pathID.count - (viewIndex + 1))
        path.removeLast(path.count - (viewIndex + 1))
    }
    
    func indexForView(withID identifier: String) -> Int? {
        pathID.firstIndex { $0 == identifier }
    }
}


public enum ModalPresentationStyle {
    case sheet
    case fullScreen
}

struct PresentedModal: Identifiable {
    var id: UUID = UUID()
    var view: AnyView
    let style: ModalPresentationStyle
}
