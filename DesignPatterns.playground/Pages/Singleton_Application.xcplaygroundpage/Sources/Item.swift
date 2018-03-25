import Foundation

public class Item {
    
    public let name: String
    public let createdAt: Date = Date()
    private var completed: Bool = false
    
    public init (_ name: String) {
        self.name = name
        
    }
    
    public func getName () -> String {
        return self.name
        
    }
    
    public func isCompleted () -> Bool {
        return self.completed
        
    }
    
    public func set(completed: Bool) {
        self.completed = completed
        
    }
    
}
