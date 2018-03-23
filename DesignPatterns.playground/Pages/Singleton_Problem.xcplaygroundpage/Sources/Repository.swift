import Foundation

public class Repository<T> : Observable  {
    
    public override init () {
        // make construcotr public
        
    }
    
    private var items: [T] = []
    
    public func store (item: T) {
        self.items.append(item)
        self.notifyDatasetChanged()
        
    }
    
    public func update (item: T) {
        self.notifyDatasetChanged()
        
    }
    
    public func getAll () -> [T] {
        return self.items
        
    }
    
}
