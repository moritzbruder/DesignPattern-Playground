import Foundation

public class Item {
    
    public let name: String
    public let createdAt: Date
    private var completed: Bool = false
    
    public init (_ name: String) {
        self.name = name
        self.createdAt = Date.init()
        
    }
    
    public func isCompleted () -> Bool {
        return self.completed
        
    }
    
    public func set(completed: Bool) {
        self.completed = completed
        
    }
    
}
