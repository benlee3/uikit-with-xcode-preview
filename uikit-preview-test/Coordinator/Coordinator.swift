//
//  Coordinator.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/18/21.
//
// from: https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps

import Combine
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var state: AppState
    var cancellables = Set<AnyCancellable>()
    
    init(navigationController: UINavigationController,
         state: AppState) {
        self.navigationController = navigationController
        self.state = state
    }
    
    func start() {
        let vc = FirstViewController(state: self.state)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.state.count += 1
            }.store(in: &cancellables)
    }
    
    func showSecondViewController() {
        let vc = SecondViewController(state: self.state)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    
}
