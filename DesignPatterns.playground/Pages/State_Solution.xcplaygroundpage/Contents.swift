//: [Previous](@previous)

import Foundation
import UIKit

//: ## Preparing to use the State-pattern
/*:
 First, take a look at how the State pattern works in theory:
 ![State pattern animation](state.mp4 width="600" height="400")
 To get started, we must define **which functions are state-dependent** and create a protocol for them.\
 In our case it's the `toggle()` and `getImage()` functions of the LightbulbDelegate
 */
// This is the protocol with our state-dependent functions:
protocol LightbulbState {
    
    /**
     Returns an image to show in the ViewController
     */
    func getImage () -> UIImage
    
    /**
     Turns the lightbulb on or off
     */
    func toggle ()    
    
}

/*:
 We can then **implement this protocol for each state**, keeping related code together and unrelated code separate.\
 An implementation of the `LightbulbState`-protocol for the state "disconnected" for example could look like this:
 */

// This is a so-called "concrete state" implementation, as it represents a specific state (in this case, the lightbulb is not connected)
class LightbulbDisconnectedState : LightbulbState {
    
    private let context: LightbulbContext
    
    public init (context: LightbulbContext) {
        self.context = context
        
    }
    
    func getImage() -> UIImage {
        return UIImage.init(named: "image/disconnected")!
        
    }
    
    func toggle() {
        NoConnectionDialog().show()
        
    }
    
}

/*:
 If we now implement the `LightbulbDelegate`-protocol, **we simply forward all state-dependent functions** to our `LightbulbState`:
 */

// This is our implementation of the delegate. The state-dependent functions are simply forwarded to the concrete state.
// All state-independent functions are implemented in this class.
class LightbulbContext: LightbulbDelegate {
    
    private var state: LightbulbState!
    
    public func set(state: LightbulbState) {
        self.state = state
        
    }
    
    func getImage() -> UIImage {
        return state.getImage()
        
    }
    
    func toggle() {
        state.toggle()
        
    }
    
    func getName() -> String {
        return "Kitchen light 1"
        
    }
    
}

/*:
 The class that calls the concrete states is **typically called "Context"**.
 
 Go to the next page to see how we use this in our app!
 */
//: [Next](@next)
