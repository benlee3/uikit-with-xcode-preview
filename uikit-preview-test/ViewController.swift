//
//  ViewController.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import UIKit

class ViewController: UIViewController {
    var testView: TestView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        testView = TestView()
        view = testView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

