//: [Previous](@previous)

//: ## Our first actual Singleton
/*:
 We decided to keep **all our repositories centralized in one object** that should be **accessible from everywhere** in an equally centralized way.
 
 The Singleton-pattern is the concept of using a class in a way to **only allow one single instance**.
 
 We adjusted our `AppRepositories`-class from before a little to have a **private constructor**\
 Now there is no way of creating an `AppRepositories`-instance from any where but inside the class itself.\
 We also added one **static** member of the same type: `AppRepositories`. Take a look for yourself below:
 */
class AppRepositories {
    
    // The static member, this is typically called "shared" in Swift
    public static let shared = AppRepositories()
    
    private init () {
        // private constructor
        
    }
    
    // Our repositories
    public let shopping = Repository<Item>()
    public let user = Repository<String>()
    
}
/*:
 Now we can use the object from everywhere like so:
 */
// example to retrieve all shopping-list items
let allItems = AppRepositories.shared.shopping.getAll()
/*:
 This means we now have a centralized way of accessing our repositories. Go to the next page to use it in our shopping-list app
 
 [Next](@next)
 */
