//: [Previous](@previous)

//: # The Observer pattern
/*:
 Let's start with our example again.
 
 We have the same application with a list and an item counter running.
 
 Our goal is now to make sure that the list and counter update whenever our repository changes
 
 The basic concept behind this pattern is, that `Observer`-objects can watch `Observable`-objects and be notified when the `Observale`-object changes
 
 Let's take a look at the `Observable`-class
 */
class Observable {
    
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
    func notifyDatasetChanged () {
        // Go through the list of observers and notify every one of them
        for observer in observers {
            observer.datasetChanged(observable: self)
            
        }
    }
    
}
 
/*:
 * Experiment:
 So let's get started and change our Repository-class from before to extend the Observable class
 
 - Example:
 To extend a class in swift you add the name of the class you want to extend after a colon, like so:\
 \
 `public class Train : Vehicle {`\
 \
 `}`\
 \
 (Train extends Vehicle)
 */
// Change the code here to make Repository an Observable
public class Repository<T> {
    
    private var items: [T] = []
    
    public func store (item: T) {
        self.items.append(item)
        
    }
    
}
/*:
 *Nice!* now that our repository is "observable", we can go ahead and take a look at the Observer-protocol:
 */
protocol Observer {
    
    /**
     This function is called whenever one of the Observable-instances this Observer is watching changes
     It has an attribute "observable" to tell which Observable changed in case the Observer is watching multiple Observables
    */
    func datasetChanged (observable: Observable)
    
}

/*:
 Continue to the next chapter to start using this pattern with our shopping-list app!

 [Next](@next)
 */
