import Foundation

public class Item {
    
    private let name: String
    
    public init (_ name: String) {
        self.name = name
        
    }
    
    public func getName () -> String {
        return self.name
        
    }
    
    public static let test = "wowy"
    
}
