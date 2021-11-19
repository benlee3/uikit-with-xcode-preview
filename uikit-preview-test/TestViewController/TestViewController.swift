//
//  TestViewController.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import Combine
import UIKit

class TestViewController: UIViewController {
    var testView: TestView?
    var state: AppState
    var cancellables = Set<AnyCancellable>()
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        testView = TestView()
        view = testView
        setupSinksAndTargets()
    }
    
    init(state: AppState) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    func setupSinksAndTargets() {
        testView?.button.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        testView?.secondViewButton.addTarget(self, action: #selector(goToSecondViewController), for: .touchUpInside)
        state.$count.sink { [weak self] in
            self?.testView?.counter.text = String($0)
        }.store(in: &cancellables)
    }
    
    @objc func increaseCount() {
        print("in increaseCount()")
        state.count += 1
    }
    
    @objc func goToSecondViewController() {
        coordinator?.showSecondViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
