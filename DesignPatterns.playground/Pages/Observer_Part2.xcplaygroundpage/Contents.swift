//: [Previous](@previous)

import Foundation
import PlaygroundSupport

/*:
 ## Let's try the Observable pattern with our shopping-app
 
 Our shopping-list app is running in the Live View again.
 
 We made sure that our ViewController implements the `Observer`-protocol, so we now only have to tell it to observe our repository
*/

// Our (observable) repository
let repository = Repository<Item>()

// We will fill the repository with dummy data again
repository.store(item: Item("Milk"))
repository.store(item: Item("Bread"))
repository.store(item: Item("Peanut Butter"))

// The view controller from before, we changed it to implement the Observer protocol
let controller = ShoppingListViewController()
controller.set(repository: repository)
// Show the controller in the Live View window
PlaygroundPage.current.liveView = controller

/*:
 * Experiment:
  Try to click on the **Add Item** button again
 
 Nothing changed, right? That's because we also have to tell our `controller` to start watching our `repository`
 
 * Experiment:
  Go ahead and add a line of code below that lets our `controller`  watch the `repository`
 
 - Note:
 The function you want to use now is called `add(observer:)` and is a member of the `Observable` class\
 Remember: `repository` is our `Observable` and `controller` the `Observer` that should watch it
 */

// Add your code here:

repository.add(observer: controller)


/*:
 - Note:
 In case you're having difficulties, the line of code you need is at the bottom of this file ;)
 
 Now we should try if it's working:
 * Experiment:
 Add an item in the Live View again and check if the list and counter update accordingly!
 */
/*:
 ## Build your own Observer
 Ok great, it is working, but now you should build your own Observer.
 
 * Experiment:
 Edit the class below to do something when the data has changed (for example print a message to the console) and use the `add(observer:)` function again to add your new Observer to the repository
 */

class MyObserver : Observer {
    
    func datasetChanged(observable: Observable) {
        // Do something here
        
    }
    
}

let myObserver = MyObserver()

// register myObserver to watch repository here:




/*:
 ## Conclusion
 
 You have just used the **biggest advantage of the Observer-pattern**.
 
 We have *one object that multiple other objects depend on*, and *all of them are notified* whenever something in our repository changes.
 
 We could now also let other parts of our software, like persistance or push-notifications, watch the repository
 
 Using this pattern we are **very flexible** both in terms of observing objects and notifying objects
 */


/*:
 Go to the next chapter to meet the **Singleton** pattern!
 
 [Next](@next)
 */







// ================================================================================================
/*:
 - Example:
 *Solution for Experiment no. 1:*\
 `repository.add(observer: controller)`
 */
