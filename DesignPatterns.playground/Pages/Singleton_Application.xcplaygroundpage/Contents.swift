//: [Previous](@previous)

import PlaygroundSupport
import UIKit

//: ## Using our new Singleton
/*:
 I changed our `ShoppingListViewController` by removing the `set(repository:)` function and using the repository of our `AppRepositories`-singleton
 
 This means that we can use our repositories like so, from now on:
 */
AppRepositories.shared.shopping.store(item: Item("Water"))

// if we use a repository frequently we can obviously also create a constant holding a specific repository to make our code look nicer:
let shoppingRepo = AppRepositories.shared.shopping

// Now we can use it just like before:
shoppingRepo.store(item: Item("Bread"))
shoppingRepo.store(item: Item("Butter"))

/*:
 I also made sure that our `ShoppingListViewController` **starts observing the repository by itself** in its constructor, so we get notified about any changes in the repo
 */
/*:
 * Experiment:
  Go take a look at our app again and click on one of the items.\
 You can see that, unlike before, it now changes in both tabs
 */

/*:
 ## Your turn
 To **get you a little more involved again**, I want you to complete the function below to choose one name at random from the list of all users and print it to the console
 */
func printRandomName () {
    // Choose one name from the user-repository and print it to the console
    
}

// Add a few users
AppRepositories.shared.user.store(item: "Max")
AppRepositories.shared.user.store(item: "Jane")
AppRepositories.shared.user.store(item: "Earl")

// Call your function
printRandomName()

/*:
 We will continue to use our AppRepositories class, so you can get more comfortable with it.\
 But now head over to the next chapter!
 */
//: [Next](@next)

PlaygroundPage.current.liveView = TabBarController()
