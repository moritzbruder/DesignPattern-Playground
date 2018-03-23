//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//: # The Singleton pattern
/*:
 Next we want to add a feature that allows our user to **tap an item to mark it as completed** and to add a **second screen that only show not-yet-completed items**
 
 Until now we have used an function of our ViewController to pass the repository object like this:
 
 `shoppingController.set(repository: myRepository)`
 
 This has the disadvantage that **we always have to pass our repository-object to every view**, service and so on, which is ugly and not very maintainable
 */

/*:
 Let's also say we have a **second Repository**-object that holds our user's WHATEVER
 */
// These are both our repositories
let shoppingRepository = Repository<Item>()
let userRepository = Repository<Item>()
/*:
 Now, if we use the same system as before and expand our app a little more, **we soon have constructor's with a lot of arguments**
 
 This is why we decide to **keep all our repositories neatly collected in one single object**, take a look at this new class:
 */
class AppRepositories {
    
    public let shopping = Repository<Item>()
    public let user = Repository<String>()
    
}
/*:
 If we create an instance of this class like below
 */
// New instance
let repos = AppRepositories()
/*:
 We can now use it to interact with **all of our repositories from one object**, like this:
 */
// Add 2 new items
repos.shopping.store(item: Item("Milk"))
repos.shopping.store(item: Item("Cookies"))

// Add a new user
repos.user.store(item: "Moritz")
/*:
 So this is a little better, but we still have to pass it to every view, service etc. to use it.
 
 Go to the next page to learn, how the Singleton-pattern helps us to solve that problem
 
 [Next](@next)
 */

PlaygroundPage.current.liveView = TabBarController()
