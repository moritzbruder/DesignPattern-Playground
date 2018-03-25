//: [Previous](@previous)

import PlaygroundSupport
import UIKit

//: ## Using our new Singleton
/*:
 I changed our `ShoppingListViewController` by removing the `set(repository:)` function and using the repository of our `AppRepositories`-singleton instead.
 
 From now on you can use your repositories like so:
 */
AppRepositories.shared.shopping.store(Item("Water"))

// if you use a repository frequently you can also create a constant holding a specific repository to make our code look nicer:
let shoppingRepo = AppRepositories.shared.shopping

// Now we can use it just like before:
shoppingRepo.store(Item("Bread"))
shoppingRepo.store(Item("Apples"))

/*:
 I also made sure that our `ShoppingListViewController` **starts observing the repository by itself** in its constructor and updates its views when the repository changes.
 */
/*:
 * Experiment:
  Go take a look at our app again and click on one of the items.\
 You can see that it changes in both tabs
 */

/*:
 ## Your turn
 To **get you a little more involved again**, I want you to complete the function below to choose one name at random from the list of all users and print it to the console.
 - Note:
 You can use the `getAll()` function of `Repository` to get an array of all items.
 */
func printRandomName () {
    // Choose one name from the user-repository and print it to the console
    
}

// Add a few users
AppRepositories.shared.user.store("Max")
AppRepositories.shared.user.store("Jane")
AppRepositories.shared.user.store("Earl")

// Call your function
printRandomName()

/*:
 We will continue to use our AppRepositories class, so you can get more comfortable with it.\
 But now head over to the next chapter!
 */
//: [Next](@next)

PlaygroundPage.current.liveView = TabBarController()
