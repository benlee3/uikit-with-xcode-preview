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
    var store: Store<AppState, AppAction>
    var cancellables = Set<AnyCancellable>()
    
    init(navigationController: UINavigationController,
         store: Store<AppState, AppAction>) {
        self.navigationController = navigationController
        self.store = store
    }
    
    func start() {
        let vc = FirstViewController(counterViewModel: CounterViewModel(store: self.store))
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.store.send(.increaseCount)
            }.store(in: &cancellables)
    }
    
    func showFirstViewController() {
        if let viewController = checkNavigationStack(for: FirstViewController.self) {
            navigationController.popToViewController(viewController, animated: true)
        } else {
            let vc = FirstViewController(counterViewModel: CounterViewModel(store: self.store))
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showSecondViewController() {
        let vc = SecondViewController(counterViewModel: CounterViewModel(store: self.store))
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}

extension Coordinator {
    // Want to have a function that can take in any type of view controller and search for it in the navigation stack.
    // We specify a generic, T, with a type constraint which says T must be of type UIViewController.
    // We iterate through all the view controllers in the navigation controller and downcast as a view controller of type T
    // `compactMap` discards any nils returned by the downcasting operation so we are left with only view controllers that match type T. Then return the first vc from that array
    // Documentation on Generics: https://docs.swift.org/swift-book/LanguageGuide/Generics.html
    
    // One bad/lazy assumption made here is that if there are multiple VCs of the same type on the navigation stack, we will always pop to the first instance of it. Did this just for simplicity's sake
    func checkNavigationStack<T: UIViewController>(for viewControllerType: T.Type) -> UIViewController? {
        let firstViewController = navigationController.viewControllers.compactMap {
            $0 as? T
        }.first
        return firstViewController
    }
}
