//
//  FirstView.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//
// from: https://www.avanderlee.com/xcode/xcode-previews/

import UIKit

class FirstView: UIView {
    let container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.backgroundColor = .white
        
        return stack
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    let increaseCountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Increase Count!", for: .normal)
        button.anchor(widthConstant: 200, heightConstant: 70)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let secondViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to SecondViewController", for: .normal)
        button.anchor(heightConstant: 70)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let counter: UILabel = {
        let label = UILabel()
        label.text = "Count: 0"
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(container)
        self.backgroundColor = .white
        container.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.safeAreaLayoutGuide.rightAnchor)
        container.addArrangedSubview(label)
        container.addArrangedSubview(counter)
        container.addArrangedSubview(increaseCountButton)
        container.addArrangedSubview(secondViewButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct FirstViewViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return FirstView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

@available(iOS 13.0, *)
struct FirstViewController_Preview: PreviewProvider {
    static var previews: some View {
        FirstViewViewRepresentable()
    }
}
#endif
