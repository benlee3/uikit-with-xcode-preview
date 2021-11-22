//
//  FirstViewController.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import Combine
import UIKit

class FirstViewController: UIViewController {
    var firstView: FirstView?
    var counterViewModel: CounterViewModel
    var state: AppState
    var cancellables = Set<AnyCancellable>()
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func loadView() {
        firstView = FirstView()
        view = firstView
    }
    
    init(state: AppState, counterViewModel: CounterViewModel) {
        self.state = state
        self.counterViewModel = counterViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    func setupView() {
        firstView?.button.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        firstView?.secondViewButton.addTarget(self, action: #selector(goToSecondViewController), for: .touchUpInside)
        bindToViewModel()

        self.counterViewModel.objectWillChange.sink {
            self.bindToViewModel()
        }.store(in: &cancellables)
    }
    
    func bindToViewModel() {
        firstView?.counter.text = counterViewModel.countLabelText
        view.setNeedsLayout() // Not necessary for this example, but will be when creating new views or destorying views which requires the view to be laid out again
    }
    
    @objc func increaseCount() {
        state.count += 1
    }
    
    @objc func goToSecondViewController() {
        coordinator?.showSecondViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
