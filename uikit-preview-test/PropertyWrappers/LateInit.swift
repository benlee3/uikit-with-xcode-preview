//
//  LateInit.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 12/9/21.
//
//  taken from: https://gist.github.com/tmphey/0ead1b53802f860e281f89205fd1bd58

/*
 I found this propertyWrapper at work and tried finding something online and this was really the only instance I could find.
 This seems to be an idea borrowed from Kotlin: https://kotlinlang.org/docs/properties.html#checking-whether-a-lateinit-var-is-initialized
 
 Great read on propertyWrappers in Swift: https://www.swiftbysundell.com/articles/property-wrappers-in-swift/
 */
@propertyWrapper struct LateInit<T> {
  private var _value: T?
  
  var wrappedValue: T {
    get {
      guard let value = _value else {
        fatalError("Property being accessed without initialization")
      }
      return value
    }
    set {
//      guard _value == nil else {
//        fatalError("Property already initialized")
//      }
      _value = newValue
    }
  }
}
