//: [Previous](@previous)

import UIKit

//: # The State pattern
/*:
 To use this next pattern, we assume that we now have a **different application**.\
 An app that lets us **turn on and off a smart light bulb**.
 */
/*:
 We also assume that we can interact with the "physical" light bulb via the following interface:
 */
protocol Lightbulb {
    
    func turnOn()
    func turnOff()
    
}

/*:
 Our app basically consists of one button and I created a delegate to for this button:
 */

protocol LightbulbDelegate {
    
    /**
     Returns an image to show in the ViewController
    */
    func getImage () -> UIImage
    
    /**
     Turns the lightbulb on or off
    */
    func toggle ()
    
    /**
     Returns the friendly name of this lightbulb
     */
    func getName () -> String
    
}

/*:
 Now we have to consider a few different situations that we could be in:
 1. The lightbulb is on
 2. The lightbulb is off
 3. The lightbulb is offline, not reachable, broken etc.
 
 So we could use a switch statement to change the bevavior of our delegate.\
 This results in **quite a lot of code per function**.\
 Each function is then basically **multiple, unrelated functions cobbled together**.
 
 
 To do better, we will use the **State**-pattern.
 */

//: [Next](@next)
