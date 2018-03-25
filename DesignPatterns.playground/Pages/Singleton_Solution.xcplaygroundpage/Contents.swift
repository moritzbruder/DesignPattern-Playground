//: [Previous](@previous)

//: ## Our first actual Singleton
/*:
 So, we decided to keep **all our repositories centralized in one object** that should be **accessible from everywhere** in an equally centralized way.
 
 The Singleton-pattern is the concept of using a class in a way to **only allow one single instance**.
 
 I adjusted our `AppRepositories`-class from before a little to have a **private constructor**\
 Now there is no way of creating an `AppRepositories`-instance from anywhere but inside the class itself.\
 I also added one **static** member of its own type: `AppRepositories`. Take a look for yourself below:
 */
class AppRepositories {
    
    // The static member, typically called "shared" in Swift
    public static let shared = AppRepositories()
    
    private init () {
        // private constructor
        
    }
    
    // Your repositories
    public let shopping = Repository<Item>()
    public let user = Repository<String>()
    
}
/*:
 Now we can use the object from everywhere like so:
 */
// example to retrieve all shopping-list items
let allItems = AppRepositories.shared.shopping.getAll()

// example to save a username
AppRepositories.shared.user.store("Brutus")
/*:
 This means you now have a centralized way of accessing your repositories.\
 Go to the next page to use it in our shopping-list app.
 
 [Next](@next)
 */
