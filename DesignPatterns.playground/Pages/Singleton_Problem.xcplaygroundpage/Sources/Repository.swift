import Foundation

public class Repository<T> : Observable  {
    
    public override init () {
        // make construcotr public
        
    }
    
    private var items: [T] = []
    
    public func store (_ item: T) {
        self.items.append(item)
        self.notifyDatasetChanged()
        
    }
    
    public func update (_ item: T) {
        self.notifyDatasetChanged()
        
    }
    
    public func getAll () -> [T] {
        return self.items
        
    }
    
}
