import Foundation

public protocol Observer {
    
    /**
     This function is called whenever one of the Observable-instances this Observer is watching changes
     It has an attribute "observable" to tell which Observable changed in case the Observer is watching multiple Observables
     */
    func datasetChanged (observable: Observable)
    
}

public class Observable {
    
    public init () {
        // make construcotr public
        
    }
    
    /**
     This list will later hold all of our observers
     */
    private var observers: [Observer] = []
    
    /**
     We will use the add() function to start watching an Observable later
     */
    public func add (observer: Observer) {
        self.observers.append(observer)
        
    }
    
    /**
     Function for use within the Obersvable-class to notify the observers
     */
    public func notifyDatasetChanged () {
        // Go through the list of observers and notify every one of them
        for observer in observers {
            observer.datasetChanged(observable: self)
            
        }
    }
    
}
