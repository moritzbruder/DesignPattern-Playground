import Foundation
import UIKit


public class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, Observer {
    
    public init (completedOnly: Bool) {
        self.completedOnly = completedOnly
        super.init(nibName: nil, bundle: nil)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.completedOnly = false
        super.init(coder: aDecoder)
        
    }
    
    private let completedOnly: Bool
    private var items: [Item] = []
    private let tableView = UITableView()
    private let counterLabel  = UILabel(frame: CGRect(x: 14, y: 120, width: 380, height: 40))
    
    public override func loadView() {
        AppRepositories.shared.shopping.add(observer: self)
        
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
        
        self.updateViews()
        
        self.view = view
    }
    
    /* Observer implementation */
    public func datasetChanged (observable: Observable) {
        updateViews()
        
    }
    
    private func updateViews () {
        self.items.removeAll()
        for item in AppRepositories.shared.shopping.getAll() {
            if (!self.completedOnly) || !item.isCompleted() {
                self.items.append(item)
                
            }
        }
        
        tableView.reloadData()
        counterLabel.text = "\(self.items.count) items"
        
    }
    
    
    /**
     A small helper function to add an item to the list every time the button is clicked
     */
    private var addedItemsCounter = 1
    @objc func handleTap () {
        AppRepositories.shared.shopping.store(item: Item("New item #\(addedItemsCounter)"))
        addedItemsCounter += 1
        
    }
    
    /* UITableViewDelegate implementation */
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        item.set(completed: true)
        AppRepositories.shared.shopping.update(item: item)
        
    }
    
    /* UITableViewDataSource implementation */
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let attrString = NSMutableAttributedString(string: item.getName())
        if (item.isCompleted()) {
            attrString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attrString.length))
            
        }
        cell.textLabel?.attributedText = attrString
        return cell
        
    }
    
}
