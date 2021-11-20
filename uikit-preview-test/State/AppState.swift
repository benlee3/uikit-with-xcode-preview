//
//  AppState.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import Combine
import Foundation


class AppState: ObservableObject {
    // Important note from Apple Dev docs
    /*
     When the property changes, publishing occurs in the property’s willSet block, meaning subscribers receive the new value before it’s actually set on the property.
     */
    @Published var count: Int
    
    init() {
        count = 0
    }
}

protocol StateRequired {
    var state: AppState { get }
}
