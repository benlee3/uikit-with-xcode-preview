//
//  CounterViewModel.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/19/21.
//

import Combine
import Foundation

class CounterViewModel: ObservableObject {
    private var state: AppState
    private var cancellables = Set<AnyCancellable>()
    // Mark fields that are bound to the View/ViewController as `@Published` so that we can subscribe to those
    @Published private var count: Int = 0
    
    var countLabelText: String {
        return "Count: \(count)"
    }
    
    init(state: AppState) {
        self.state = state
        // Assigning the field from state to a property on the ViewModel so that we don't have to expose the entire app state to the view controller
        state.$count.assign(to: \.count, on: self).store(in: &cancellables)
    }
}
