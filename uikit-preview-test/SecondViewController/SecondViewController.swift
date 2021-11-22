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
        secondView = SecondView()
        view = secondView
    }
    
    init(state: AppState, counterViewModel: CounterViewModel) {
        self.state = state
        self.counterViewModel = counterViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        secondView?.button.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        secondView?.button2.addTarget(self, action: #selector(goToFirstView), for: .touchUpInside)
        bindToViewModel()
        self.counterViewModel.objectWillChange.sink {
            self.bindToViewModel()
        }.store(in: &cancellables)
    }
    
    func bindToViewModel() {
        secondView?.label.text = counterViewModel.countLabelText
        view.setNeedsLayout() // Not necessary for this example, but will be when creating new views or destorying views which requires the view to be laid out again
    }
    
    @objc func increaseCount() {
        state.count += 1
    }
    
    @objc func goToFirstView() {
        coordinator?.showFirstViewController()
    }
}
