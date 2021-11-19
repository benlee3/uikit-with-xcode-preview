//
//  AppState.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import Combine
import Foundation


class AppState {
    @Published var count: Int
    
    init() {
        count = 0
    }
}

protocol StateRequired {
    var state: AppState { get }
}
