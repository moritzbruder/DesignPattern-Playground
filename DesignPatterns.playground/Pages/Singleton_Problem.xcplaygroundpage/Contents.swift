//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//: # The Singleton pattern
/*:
 Next we want to add a feature that allows our user to **tap an item to mark it as completed**.\
 We also want to add a **second screen that only shows not-yet-completed items**.
 
 Until now we have used a method of our ViewController to pass the repository object like this:
 
 `shoppingController.set(repository: myRepository)`
 
 This has the disadvantage that **we always have to pass our repository-object to every view**, service and so on, which is ugly and not very maintainable
 */

/*:
 Let's also say we have a **second Repository**-object that holds a list of usernames.
 */
// These are both our repositories
let shoppingRepository = Repository<Item>()
let userRepository = Repository<Item>()
/*:
 Now, if we distribute them the same as before and expand our app a little more, **we soon have constructors with a lot of arguments**
 
 This is why we decide to **keep all our repositories neatly collected in one single object**.\
 Take a look at this new class:
 */
// One object containing all our repositories
class AppRepositories {
    
    public let shopping = Repository<Item>()
    public let user = Repository<String>()
    
}
/*:
 If we create an instance of this class, we can now use it to interact with **all of our repositories from one object**, like this:
 */
// New instance
let repos = AppRepositories()

// Add 2 new items
repos.shopping.store(item: Item("Milk"))
repos.shopping.store(item: Item("Cookies"))

// Add a new user
repos.user.store(item: "Moritz")
/*:
 So this is a little better, but we still have to pass it to every view, service etc. to use it.
 
 Go to the next page to learn how the Singleton-pattern helps us solve that problem
 
 [Next](@next)
 */
