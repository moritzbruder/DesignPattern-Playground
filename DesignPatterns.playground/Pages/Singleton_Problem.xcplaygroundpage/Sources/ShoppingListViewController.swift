import Foundation
import UIKit


public class ShoppingListViewController: UIViewController, UITableViewDataSource, UIGestureRecognizerDelegate, Observer {
    
    private var repository: Repository<Item> = Repository<Item>()
    private let tableView = UITableView()
    private let counterLabel  = UILabel(frame: CGRect(x: 0, y: 110, width: 380, height: 40))
    
    public func set (repository: Repository<Item>) {
        self.repository = repository
        updateViews()
        
    }
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        self.title = "Shopping List"
        
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 150, width: 380, height: 520)
        view.addSubview(tableView)
        
        
        counterLabel.text = "0 items"
        counterLabel.textColor = UIColor.gray
        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.boldSystemFont(ofSize: counterLabel.font.pointSize)
        view.addSubview(counterLabel)
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 20, width: 380, height: 80))
        button.setTitle("Add Item", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        view.addSubview(button)
        
        let addItemButton = UIImageView(frame: CGRect(x: 82.5, y: 60, width: 215, height: 44))
        addItemButton.image = UIImage.init(named: "AddItem_Button")
        view.addSubview(addItemButton)
        
        
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            button.firstBaselineAnchor.constraint(equalTo: view.firstBaselineAnchor)
            ])
        
        updateViews()
        
        self.view = view
    }
    
    /* Observer implementation */
    public func datasetChanged (observable: Observable) {
        updateViews()
        
    }
    
    private func updateViews () {
        tableView.reloadData()
        counterLabel.text = "\(self.repository.getAll().count) items"
        
    }
    
    public func getIcon (name: String) -> UIImage? {
        if (name.lowercased().contains("bread")) {
            return UIImage.init(named: "icon/bread")
        } else if (name.lowercased().contains("peanut")) {
            return UIImage.init(named: "icon/peanut")
        } else if (name.lowercased().contains("milk")) {
            return UIImage.init(named: "icon/milk")
        } else {
            return UIImage.init(named: "icon/new")
        }
    }
    
    /**
     A small helper function to add an item to the list every time the button is clicked
     */
    private var addedItemsCounter = 1
    @objc func handleTap () {
        repository.store(Item("New item #\(addedItemsCounter)"))
        addedItemsCounter += 1
        printRepo()
        print("")
        
    }
    
    /**
     A small function which prints the whole repository to the console
     */
    private func printRepo () {
        var result = ""
        for item in repository.getAll() {
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
        return repository.getAll().count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let item = repository.getAll()[indexPath.row]
        cell.textLabel?.text = item.name
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM 'at' HH:mm:ss"
        cell.detailTextLabel?.text = "created on \(formatter.string(from: item.createdAt))"
        cell.imageView?.image = getIcon(name: item.name)
        
        let itemSize = CGSize.init(width: 25, height: 25)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        cell.imageView?.image!.draw(in: imageRect)
        cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        
        return cell
        
    }
    
}

