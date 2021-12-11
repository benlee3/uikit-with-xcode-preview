//
//  FirstViewController.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import Combine
import Foundation
import UIKit

class FirstViewController: UIViewController {
    var firstView = FirstView()
    var counterViewModel: CounterViewModel
    var cancellables = Set<AnyCancellable>()
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func loadView() {
        view = firstView
    }
    
    init(counterViewModel: CounterViewModel) {
        self.counterViewModel = counterViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    func setupView() {
        firstView.increaseCountButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        firstView.secondViewButton.addTarget(self, action: #selector(goToSecondViewController), for: .touchUpInside)
        bindToViewModel()
    }
    
    func bindToViewModel() {
        counterViewModel.$countText
            .assign(to: \.text, on: firstView.counter)
            .store(in: &cancellables)
        
        view.setNeedsLayout() // Not necessary for this example, but will be when creating new views or destorying views which requires the view to be laid out again
    }
    
    @objc func increaseCount() {
        counterViewModel.increaseCount()
    }
    
    @objc func goToSecondViewController() {
        coordinator?.showSecondViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
