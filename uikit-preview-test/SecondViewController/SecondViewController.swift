//
//  SecondViewController.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/18/21.
//

import Combine
import UIKit

class SecondViewController: UIViewController {
    var secondView: SecondView?
    var state: AppState
    var cancellables = Set<AnyCancellable>()
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        secondView = SecondView()
        view = secondView
        setupSinksAndTargets()
    }
    
    init(state: AppState) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSinksAndTargets() {
        secondView?.button.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        state.$count.sink { [weak self] in
            print("secondView: in sink")
            print("secondView: current value: \(self?.state.count)")
            print("secondView: new value: \($0)")
            self?.secondView?.label.text = String($0)
        }.store(in: &cancellables)
    }
    
    @objc func increaseCount() {
        state.count += 1
    }
}
