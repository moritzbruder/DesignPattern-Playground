import Foundation

public class Item {
    
    public let name: String
    public let createdAt: Date
    
    public init (_ name: String) {
        self.name = name
        self.createdAt = Date.init()
        
    }
    
}
