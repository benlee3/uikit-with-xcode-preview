//
//  CounterViewModel.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/19/21.
//

import Combine
import Foundation

class CounterViewModel {
    private var state: AppState
    private let cancellables = Set<AnyCancellable>()
    
    init(state: AppState) {
        self.state = state
    }
}

//extension CounterViewModel {
//}
