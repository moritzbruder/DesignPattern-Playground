//: [Previous](@previous)

import PlaygroundSupport
import UIKit

print("Make sure to enable \"Render Documentation\" in the file inspector window :)")
/*:
 # Your project
 
 Assume that you're working on a **shopping-list-app**.
 
 It must meet these requirements:
 1. A **list of items**.
 2. An **item counter**.
 3. The list & counter must **update** when an item is added.
 
 The following class is all we need for a **shopping-list item**:
 */
public class Item {
    
    public let name: String
    public let createdAt: Date
    
    public init (_ name: String) {
        self.name = name
        self.createdAt = Date.init()
        
    }
    
}
//: To store our items, we use a **repository** like this:
public class Repository<T> {
    
    var items: [T] = []
    
    public func store (_ item: T) {
        self.items.append(item)
        
    }
    
}

// Item-Repository
let repository = Repository<Item>()

// Prefill repository with dummy items
repository.store(Item("Milk"))
repository.store(Item("Bread"))
repository.store(Item("Peanut Butter"))
repository.store(Item("Tomatoes"))
repository.store(Item("Chocolate Cookies"))
//: The repository is basically an array, but we'll make it smarter soon.
/*:
 ### Live View
 
 Look at the **Live View window** now.\
 Your app is running there.
 
 * Experiment:
 Try to add an item by clicking "**Add Item**" in the Live View.\
 **Watch the console** as you press the button.\
 Note the different behavior of user interface and internal state.
 */

/*:
 Go to the next page to meet the **Observer** pattern.\
 It will help you to **update your UI correctly**!
 
 [Next](@next)
 */













// ========================================================================================================

/*
 This is the view controller for our small application, you can ignore it
 */

public class ShoppingListViewController: UIViewController, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    private var repository: Repository<Item> = Repository<Item>()
    
    // UI-Elements
    private let tableView = UITableView()
    private let counterLabel  = UILabel(frame: CGRect(x: 0, y: 110, width: 380, height: 40))
    private let addItemButton = UIImageView(frame: CGRect(x: 82.5, y: 60, width: 215, height: 44))
    private let clickArea = UIButton(frame: CGRect(x: 0, y: 20, width: 380, height: 80))
    
    public func set (repository: Repository<Item>) {
        self.repository = repository
        updateViews()
        
    }
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        self.title = "Shopping List"
        
        // Set view properties, colors, etc.
        makeLayout()
        
        // Add list
        view.addSubview(tableView)
        
        // Add label with number of items
        view.addSubview(counterLabel)
        
        // Button image
        view.addSubview(addItemButton)
        
        // Clickable area for button
        view.addSubview(clickArea)
        
        // Move clickable area
        NSLayoutConstraint.activate([
            clickArea.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            clickArea.firstBaselineAnchor.constraint(equalTo: view.firstBaselineAnchor)
            ])
        
        // Init view values
        updateViews()
        
        self.view = view
    }
    
    /**
     Sets properties for the UI elements
    */
    private func makeLayout () {
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 150, width: 380, height: 520)
        
        counterLabel.textColor = UIColor.gray
        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.boldSystemFont(ofSize: counterLabel.font.pointSize)
        
        addItemButton.image = UIImage.init(named: "AddItem_Button")
        
        // Clickable area for image (UITapGestureRecognizer doesn't seem to work in playgrounds..)
        clickArea.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        
    }
    
    /**
     Updates the item counter and the tableView
     */
    private func updateViews () {
        tableView.reloadData()
        counterLabel.text = "\(self.repository.items.count) items"
        
    }
    
    /**
     Helper function to add an item to the list every time the button is clicked
     */
    private var addedItemsCounter = 1
    @objc func handleTap () {
        repository.store(Item("New item #\(addedItemsCounter)"))
        addedItemsCounter += 1
        printRepo()
        print("")
        
    }
    
    /**
     prints the whole repository to the console
     */
    private func printRepo () {
        var result = ""
        for item in repository.items {
            result = "\(result), Item(\"\(item.name)\")"
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
        // Create new cell
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        // Fill views
        let item = repository.items[indexPath.row]
        cell.textLabel?.text = item.name
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM 'at' HH:mm:ss"
        cell.detailTextLabel?.text = "created on \(formatter.string(from: item.createdAt))"
        cell.imageView?.image = ItemIcon.getIcon(name: item.name)
        
        // Resize image
        let itemSize = CGSize.init(width: 25, height: 25)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        cell.imageView?.image!.draw(in: imageRect)
        cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        
        return cell
        
    }
    
}

let controller = ShoppingListViewController()
controller.set(repository: repository)
PlaygroundPage.current.liveView = UINavigationController.init(rootViewController: controller)
