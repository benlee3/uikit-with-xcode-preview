//
//  TestView.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//

import Foundation
import UIKit

class TestView: UIView {
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
    
//    let image: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "hello-world-php")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        return imageView
//    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Increase Count!", for: .normal)
        button.anchor(widthConstant: 200, heightConstant: 70)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let counter: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(container)
        container.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.safeAreaLayoutGuide.rightAnchor)
        container.addArrangedSubview(label)
        container.addArrangedSubview(counter)
        container.addArrangedSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TestViewViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return TestView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

@available(iOS 13.0, *)
struct TestViewController_Preview: PreviewProvider {
    static var previews: some View {
        TestViewViewRepresentable()
    }
}
#endif
