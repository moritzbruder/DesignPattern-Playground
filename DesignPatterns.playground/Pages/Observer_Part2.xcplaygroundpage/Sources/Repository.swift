import Foundation

public class Repository<T> : Observable  {
    
    public override init () {
        // make construcotr public
        
    }
    
    private var items: [T] = []
    
    /**
     Stores the given item to the repositoryconstrucotr
     */
    public func store (_ item: T) {
        self.items.append(item)
        self.notifyDatasetChanged()
        
    }
    
    /**
     Returns an array of all items in the repository
     */
    public func getAll () -> [T] {
        return self.items
        
    }
    
}
