//: [Previous](@previous)

import PlaygroundSupport
import UIKit

//: ## Using the state in our app
/*:
 Check out the Live View again. Our lightbulb-app is running there.\
 I created a simple `UIViewController` that takes a LighbulbDelegate to show an icon and calls the `toggle()` function, when a button is pressed.\
 I also created two more concrete states: `LightbulbOn` and `LightbulbOff`
 */
// The new UIViewController
let lightbulbViewController = LightbulbViewController()

// Our LightbulbContext implementation from before (I added a viewController-attribute to be able to show an alert-dialog)
let context = LightbulbContext(viewController: lightbulbViewController)

// Set the LightbulbContext as the delegate of the ViewController
lightbulbViewController.delegate = context

// Show in Live View
PlaygroundPage.current.liveView = UINavigationController(rootViewController: lightbulbViewController)
/*:
 I implemented `LightbulbOn` and `LightbulbOff` in a way so that the `toggle()` function calls `context.set(state:)` and sets the state to its opposite.\
 If you **check out the app in the live view** this means that you can **turn the light on and off**. Try it.
 
 Now **uncomment the next line** and see what happens if you **click the toggle-button**.
 */

//context.set(state: LightbulbDisconnectedState(context: context))


/*:
 ## It's your turn again
 * Experiment:
 Now you go ahead and create your own `LightbulbState`.\
 I created a class `LightbulbTestState` below. You should complete it and then call `context.set(state:)` with an instance of your new state.
 - Note:
 There is a sample image file in the Resources folder (*image/swift.png*). You can use it with `UIImage(named: "image/swift")`.\
 For the toggle action you simply print something to the console.
 */
class LightbulbTestState : LightbulbState {
    
    private let context: LightbulbContext
    
    public init (context: LightbulbContext) {
        self.context = context
        
    }
    
    public func getImage() -> UIImage {
        // return an actual image here
        return UIImage.init()
        
    }
    
    public func toggle() {
        // Do something here
        
    }
    
}


// Set the state here







/*:
 ## Conclusion
 As you can see in the class that you just edited, there is **mostly one advantage** of the State-pattern.\
 **Instead of giant functions** with switch statements we now have all logic for each state nicely capsuled in **one object per state**.\
 We can also **easily switch** the behavior of the context-object.
 */
 
//: [Next](@next)
