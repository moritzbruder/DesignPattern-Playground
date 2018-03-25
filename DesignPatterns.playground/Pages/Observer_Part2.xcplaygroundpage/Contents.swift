//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

/*:
 ## Let's try the Observable pattern with our shopping-app
 
 Our shopping-list app is running in the **Live View** again.
 
 I changed the ViewController to implement the `Observer`-protocol:\
 `public class ShoppingListViewController : UIViewController, Observer`
 
 Now we only have to tell it to **observe your repository**.
*/
// Your (observable) repository
let repository = Repository<Item>()

// Here we fill the repository with dummy data again
repository.store(Item("Milk"))
repository.store(Item("Bread"))
repository.store(Item("Peanut Butter"))
repository.store(Item("Tomatoes"))
repository.store(Item("Chocolate Cookies"))


// The same ViewController as before, but I changed it to implement the Observer protocol
let controller = ShoppingListViewController()
controller.set(repository: repository)

// Show the ViewController in the Live View window
PlaygroundPage.current.liveView = UINavigationController.init(rootViewController: controller)
/*:
 * Experiment:
  Try to click on the **Add Item** button again.
 
 **Nothing changed, right?** That's because we have to tell `controller` to **start observing** `repository`.
 
 * Experiment:
  Add a line of code below that makes `controller` observe `repository`.
 
 - Note:
 Use `add(observer:)` to achieve this.\
 `add(observer:)` is part of the `Observable` class.\
 Remember: `repository` is your `Observable` and `controller` the `Observer` that should watch it.
 */

// Add your code here:




/*:
 - Note:
 In case you're having difficulties, the line of code you need is at the bottom of this file 😎
 
 Now we should try if it's working:
 * Experiment:
 Add an item in the Live View again.\
 *Check if the list and counter update correctly!*
 */
/*:
 ## Build your own Observer
 
 * Experiment:
 Edit the class below to print "wuff!" to the console when the data has changed.\
 Use `add(observer:)` again to let `brutus` observe the repository
 */

class Watchdog : Observer {
    
    func datasetChanged(observable: Observable) {
        // Do something here
        
        
        
    }
    
}

let brutus = Watchdog()

// register brutus to observe repository here:




/*:
 ## Conclusion
 
 You have just used the **biggest advantage of the Observer-pattern**.
 
 We have *one object that multiple other objects depend on*, and *all of them are notified* whenever something in our repository changes.
 
 We could now also let other parts of our software, like persistance or push-notifications, watch the repository.
 
 Using this pattern we are **very flexible** both in terms of observing objects and notifying objects.
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
