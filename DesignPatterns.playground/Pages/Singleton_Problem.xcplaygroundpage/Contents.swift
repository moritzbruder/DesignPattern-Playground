//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//: # The Singleton pattern
/*:
 Next we want a feature for **tapping an item to mark it as completed**.\
 We also want a **second screen that only shows not-yet-completed items**.
 
 Before we used a method of our ViewController to pass the repository object like this:\
 `shoppingController.set(repository: myRepository)`
 
 This means **we manually have to pass our repository-object to every view**, service and so on.\
 This is unnecessary and **not very maintainable**.
 */

/*:
 Let's say we also have a **second Repository**-object that holds a list of usernames.
 */
// These are both your repositories
let shoppingRepository = Repository<Item>()
let userRepository = Repository<String>()
/*:
 Now, if we distribute them the same as before and expand our app a little more, **we soon have constructors with a lot of arguments**
 
 This is why we decide to **keep all our repositories neatly collected in one single object**.\
 Take a look at this new class:
 */
// One object containing all your repositories
class AppRepositories {
    
    public let shopping = Repository<Item>()
    public let user = Repository<String>()
    
}
/*:
 If we create an instance of this class, you can now use it to interact with **all of your repositories from one object**, like this:
 */
// New instance
let repos = AppRepositories()

// Add 2 new items
repos.shopping.store(Item("Milk"))
repos.shopping.store(Item("Cookies"))

// Add a new user
repos.user.store("Moritz")
/*:
 So this is a little better, but we still have to pass it to every view, service etc. to use it.
 
 Go to the next page to learn how the Singleton-pattern helps you solve that problem.
 
 [Next](@next)
 */
