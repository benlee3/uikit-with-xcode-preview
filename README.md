# Demo iOS App Learnings
This project is just a sandbox environment for me to play around with various app architectures, patterns, and tools. Things I hope to work on in this project are (but not limited to):
- Utilizing [Xcode previews for UIKit based views](https://www.avanderlee.com/xcode/xcode-previews/) (by wrapping them in SwiftUI views)
  - This was stupid easy
- Utilizing the [Coordinator Pattern](https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps) for screen navigation
- Modeling app state with a [Store architecture](https://www.pointfree.co/collections/composable-architecture/reducers-and-stores)
  - Still WIP - there is a single state class being centralized by the Coordinator that is being passed into each VC being presented. Need to abstract this into a "store" with a reducer handling updates to state
- Utilizing [Combine](https://developer.apple.com/documentation/combine) (particularly the [Published property wrapper](https://developer.apple.com/documentation/combine/published)) in order to drive real-time UI updates by binding the UI to state
  - Haven't figured out a good way to reconcile this with the MVVM architecture yet
- Utilizing [MVVM](https://www.swiftbysundell.com/articles/different-flavors-of-view-models-in-swift/)
  - Haven't introduced this into the project yet

## Random notes
- While fiddling around with the Coordinator, I made a cool helper function to see if a UIViewController exists in a navigation stack and to pop right to it. This is something I'm going to keep with me forever. It also forced me to freshen up on my understanding of [Swift metatypes](https://swiftrocks.com/whats-type-and-self-swift-metatypes)