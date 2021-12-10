//
//  CounterViewModel.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/19/21.
//

import Combine
import Foundation

class CounterViewModel: ObservableObject {
    // Keep app state private, we only want to expose relevant fields to the view controller
//    private var state: AppState
    private var store: Store<AppState, AppAction>
    private var cancellables = Set<AnyCancellable>()
    
    // Mark fields that are bound to the View/ViewController as `@Published` so that we can subscribe to any changes that occur to these fields via `objectWillChange`
    // Marking this field as private because in this case we only want to expose the formatted string from the `countLabelText` property
    @Published private var count: Int = 0
    
    // This is the public facing property that performs the "business logic" of what we need to do with the stored value (`count`) that we have
    var countLabelText: String {
        return "Count: \(count)"
    }
    
//    init(state: AppState) {
    init(store: Store<AppState, AppAction>) {
//        self.state = state
        self.store = store
        // Assigning the field from state to a property on the ViewModel so that we don't have to expose the entire app state to the view controller
//        state.$count.assign(to: \.count, on: self).store(in: &cancellables)
        store.$value.sink { [weak self] state in
            self?.count = state.count
        }.store(in: &cancellables)
    }
}

extension CounterViewModel {
    func increaseCount() {
//        state.count += 1
        store.send(.increaseCount)
    }
}
