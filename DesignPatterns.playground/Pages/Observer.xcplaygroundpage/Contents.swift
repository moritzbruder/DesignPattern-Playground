//: [Previous](@previous)

//: # The Observer pattern
/*:
 Your goal is now to make the shopping-list and item counter **update whenever our repository changes**.
 
 See how the Observable-pattern works in theory:
 
 ![Observable pattern animation](observer.gif)
 \
 \
 \
 In code the Observable-pattern looks like the following class:\
 *Check it out and read the comments!*
 */
public class Observable {
    
    /**
     This list will hold all of our observers
    */
    private var observers: [Observer] = []
    
    /**
     We will use add(observer:) to start watching an Observable
     */
    public func add (observer: Observer) {
        self.observers.append(observer)
        
    }
    
    /**
     This function notifies all observers that something changed
    */
    func notifyDatasetChanged () {
        for observer in observers {
            observer.datasetChanged(observable: self)
            
        }
    }
    
}
/*:
 To make a class *observable* it needs to extend the class `Observable`.\
 Now you get to make the repository observable!
 
 * Experiment:
 Change the code below to make `Repository` observable.
 
 - Example:
 Quick reminder: In Swift you extend a class like this:\
 `class YourClass : ClassToExtend {`\
          `    ... (einrücken)`\
 `}`
 */
// Change the code here to make Repository an Observable
public class Repository<T> {
    
    private var items: [T] = []
    
    public func store (item: T) {
        self.items.append(item)
        
    }
    
}
/*:
 Check the console to see if your changes worked.\
 Now that the repository is observable, we take a look at the Observer-protocol:\
 *Read the comments!*
 */
public protocol Observer {
    
    /**
     This function is called whenever one of the Observables changes
     The "observable"-Attribute contains the Observable that changed
    */
    func datasetChanged (observable: Observable)
    
}
//: All objects that want to observe something (for example observe your repository) must implement this protocol.
/*:
 Continue to the next page and use this pattern with your shopping-list app!

 [Next](@next)
 */


// Print experiment result
print((Repository<String>() as AnyObject) is Observable ? "Nice! Repository is an Observable. Well done." : "Repository is not observable yet.")
