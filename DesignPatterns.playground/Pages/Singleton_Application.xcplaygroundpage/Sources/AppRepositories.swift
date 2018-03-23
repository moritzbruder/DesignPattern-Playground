import Foundation

public class AppRepositories {
    
    // The static member, this is typically called "shared" in Swift
    public static let shared = AppRepositories()
    
    private init () {
        // private constructor
        
    }
    
    // Our repositories
    public let shopping = Repository<Item>()
    public let user = Repository<String>()
    
}
