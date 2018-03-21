//: [Previous](@previous)
import PlaygroundSupport
import UIKit

print("Make sure to enable \"Render Documentation\" in the file inspector window :)")
/*:
 # Our project
 
 Ok, let's say we want to show **a list of shopping-list-items** in our application along with an item-counter on the top. Just like the view you can see in the live-preview of this playground
 
 Let's consider the following class is all we need for a **shopping-list item**:
 */
public class Item {
    
    private let name: String
    
    public init (_ name: String) {
        self.name = name
        
    }
    
    public func getName () -> String {
        return name
        
    }
    
}
//: To store our items, we use a **repository** like this:
public class Repository<T> {
    
    var items: [T] = []
    
    public func store (item: T) {
        self.items.append(item)
        
    }
    
}


// Item-Repository
let repository = Repository<Item>()

/*:
 ### Live View
 
 Make sure to take a look at the Live View window, there's a simple iOS-App running there.
 
 * Experiment:
 Go ahead and add an item or two in the live preview and see what happens.
 
 Watch the console when you press the button. The full array is printed there. Note the different behavior of user interface and internal state.
 */
// Prefill repository with a few items
repository.store(item: Item("Milk"))
repository.store(item: Item("Bread"))
repository.store(item: Item("Peanut Butter"))

/*:
 This will be our small project to test some *design patterns* with!
 
 Head over to the next chapter to meet the **Observer** pattern, which will help us to update our UI correctly
 
 [Next](@next)
 */













// ========================================================================================================

/*
 This is the view controller for our small application, you can ignore it
 */

public class ShoppingListViewController: UIViewController, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    private var repository: Repository<Item>!
    private let tableView = UITableView()
    
    public func set (repository: Repository<Item>) {
        self.repository = repository
        tableView.reloadData()
        
    }
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 100, width: 380, height: 600)
        view.addSubview(tableView)
        
        let counterLabel = UILabel(frame: CGRect(x: 14, y: 60, width: 380, height: 40))
        counterLabel.text = "No. items: 3"
        counterLabel.textColor = UIColor.gray
        view.addSubview(counterLabel)
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 20, width: 380, height: 80))
        button.setTitle("Add Item", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        view.addSubview(button)
        
        
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            button.firstBaselineAnchor.constraint(equalTo: view.firstBaselineAnchor)
            ])
        
        
        self.view = view
    }
    
    
    /**
     A small helper function to add an item to the list every time the button is clicked
     */
    private var addedItemsCounter = 1
    @objc func handleTap () {
        repository.store(item: Item("New item #\(addedItemsCounter)"))
        addedItemsCounter += 1
        printRepo()
        
    }
    
    /**
     A small function which prints the whole repository to the console
     */
    private func printRepo () {
        var result = ""
        for item in repository.items {
            result = "\(result), Item(\"\(item.getName())\")"
        }
        let index = result.index(result.startIndex, offsetBy: 2)
        print("[\(result.suffix(from: index))]")
        
    }
    
    /* UITableViewDataSource implementation */
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = repository.items[indexPath.row].getName()
        return cell
        
    }
    
}

let controller = ShoppingListViewController()
controller.set(repository: repository)
PlaygroundPage.current.liveView = controller
