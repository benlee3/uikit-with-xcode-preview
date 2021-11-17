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
        stack.distribution = .fill
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
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hello-world-php")
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.anchor(widthConstant: 100, heightConstant: 20)
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(container)
        container.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.safeAreaLayoutGuide.rightAnchor)
        container.addArrangedSubview(label)
        container.addArrangedSubview(image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
