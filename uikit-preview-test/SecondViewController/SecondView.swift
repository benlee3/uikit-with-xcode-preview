//
//  SecondView.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/19/21.
//

import UIKit

class SecondView: UIView {
    
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
        label.text = "Count: 0"
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Increase Count!", for: .normal)
        button.anchor(widthConstant: 200, heightConstant: 70)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.setTitle("Go to first view controller", for: .normal)
        button.anchor(heightConstant: 70)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(container)
        self.backgroundColor = .white
        container.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.safeAreaLayoutGuide.rightAnchor)
        container.addArrangedSubview(label)
        container.addArrangedSubview(button)
        container.addArrangedSubview(button2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SecondViewViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return SecondView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

@available(iOS 13.0, *)
struct SecondViewController_Preview: PreviewProvider {
    static var previews: some View {
        SecondViewViewRepresentable()
    }
}
#endif
