//
//  AppState.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import Combine
import Foundation


//class AppState: ObservableObject {
    // Important note from Apple Dev docs
    /*
     When the property changes, publishing occurs in the property’s willSet block, meaning subscribers receive the new value before it’s actually set on the property.
     */
//    @Published var count: Int
//
//    init() {
//        count = 0
//    }
//}

    /*
     AppState is a struct here because structs are value types and great for being a simple container for data
     https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes
     */
struct AppState {
    var count: Int
    @LateInit var firstName: String
    @LateInit var lastName: String
}

extension AppState {
    static var initialState = AppState(count: 0)
}

    /*
     Using generics here: `Value` and `Action`.
     The concrete types for `Value` and `Action` are set in SceneDelegate.swift as `AppState` and `AppAction`, respectively
     Using generics here allows us to decouple
     */
class Store<Value, Action>: ObservableObject {
    let reducer: (inout Value, Action) -> Void
    
    // Important note from Apple Dev docs
    /*
     When the property changes, publishing occurs in the property’s willSet block, meaning subscribers receive the new value before it’s actually set on the property.
     */
    @Published private(set) var value: Value

    init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.reducer = reducer
        self.value = initialValue
    }

    func send(_ action: Action) {
        self.reducer(&self.value, action)
    }
}

func appReducer(value: inout AppState, action: AppAction) -> Void {
    switch action {
    case .increaseCount:
        value.count += 1
    }
}

enum AppAction {
    case increaseCount
}
