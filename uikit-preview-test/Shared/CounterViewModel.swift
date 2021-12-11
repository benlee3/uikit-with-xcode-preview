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
    private var store: Store<AppState, AppAction>
    private var cancellables = Set<AnyCancellable>()
    
    // Mark fields that are bound to the View/ViewController as `@Published` so that the view controller can subscribe/assign these published values directly to the view. Think "binding" to the view.
    @Published var countText: String?
    
    init(store: Store<AppState, AppAction>) {
        self.store = store
        /// Assigning the field from state to a property on the ViewModel so that we don't have to expose the entire app state to the view controller
        /// Performing the business logic of taking the "raw" `count` value and adding it to the `countTextTemplate` string value
        store.$value.compactMap { state in
            String(format: CounterViewModel.countTextTemplate, String(state.count))
        }.assign(to: \.countText, on: self).store(in: &cancellables)
    }
}

extension CounterViewModel {
    func increaseCount() {
        store.send(.increaseCount)
    }
}

extension  CounterViewModel {
    static let countTextTemplate = "Count: %@"
}
