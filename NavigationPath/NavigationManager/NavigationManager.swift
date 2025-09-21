//
//  NavigationManager.swift
//  NavigationPath
//
//  Created by Sachin Daingade on 21/09/25.
//
import Combine
import Foundation

public final class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    @Published var clickedBackButton: Bool = false
    var pathID: [String] = []
    var backButtonVisible: Bool = false
    public static let shared: NavigationManager = NavigationManager()
    
    public func navigate(_ page: some View, backButtonVisible: Bool = true, showConfirmation: Bool = false) {
        pathID.append("\(type(of: page))")
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
        path.removeLast()
        pathID.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    public func navigateTo(_ identifier: String) {
        guard let viewIndex = indexForView(identifier) else {
        debugPrint("identifier \(identifier) not found. you are trying to navigate to a view that is not in the stack")
            return
        }
        pathID.removeLast(pathID.count - (viewIndex + 1))
        path.removeLast(path.count - (viewIndex + 1))
    }
    
    func indexForView(withID identifier: String) -> Int? {
        pathID.first(where: { $0 == identifier })
    }
}

