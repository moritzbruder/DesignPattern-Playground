import Foundation
import UIKit

public class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, Observer {
    
    private var repository: Repository<Item>!
    private let tableView = UITableView()
    private let counterLabel  = UILabel(frame: CGRect(x: 14, y: 120, width: 380, height: 40))
    
    public func set (repository: Repository<Item>) {
        self.repository = repository
        updateViews()
        
    }
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 160, width: 380, height: 600)
        view.addSubview(tableView)
        
        
        counterLabel.text = "0 items"
        counterLabel.textColor = UIColor.gray
        view.addSubview(counterLabel)
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 80, width: 380, height: 80))
        button.setTitle("Add Item", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        view.addSubview(button)
        
        
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            button.firstBaselineAnchor.constraint(equalTo: view.firstBaselineAnchor, constant: 60)
            ])
        
        
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
    
    
    /**
     A small helper function to add an item to the list every time the button is clicked
     */
    private var addedItemsCounter = 1
    @objc func handleTap () {
        repository.store(item: Item("New item #\(addedItemsCounter)"))
        addedItemsCounter += 1
        
    }
    
    /**
     A small function which prints the whole repository to the console
     */
    private func printRepo () {
        var result = ""
        for item in repository.getAll() {
            result = "\(result), Item(\"\(item.getName())\")"
        }
        let index = result.index(result.startIndex, offsetBy: 2)
        print("[\(result.suffix(from: index))]")
        
    }
    
    /* UITableViewDelegate implementation */
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = repository.getAll()[indexPath.row]
        item.set(completed: true)
        repository.update(item: item)
        
    }
    
    /* UITableViewDataSource implementation */
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.getAll().count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = repository.getAll()[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let attrString = NSMutableAttributedString(string: item.getName())
        print("\(item.isCompleted())")
        if (item.isCompleted()) {
            attrString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attrString.length))

        }
        cell.textLabel?.attributedText = attrString
        return cell
        
    }
    
}
