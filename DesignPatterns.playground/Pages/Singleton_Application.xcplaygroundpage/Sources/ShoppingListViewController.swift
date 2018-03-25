import Foundation
import UIKit


public class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, Observer {
    
    private let tableView = UITableView()
    private let counterLabel  = UILabel(frame: CGRect(x: 0, y: 110, width: 380, height: 40))
    private let completedOnly: Bool
    private var items: [Item] = []
    
    public init (completedOnly: Bool) {
        self.completedOnly = completedOnly
        super.init(nibName: nil, bundle: nil)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.completedOnly = false
        super.init(coder: aDecoder)
        
    }
    
    public override func loadView() {
        AppRepositories.shared.shopping.add(observer: self)
        
        let view = UIView()
        view.backgroundColor = .white
        
        // Add list
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 150, width: 380, height: 520)
        view.addSubview(tableView)
        
        // Add label with number of items
        counterLabel.textColor = UIColor.gray
        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.boldSystemFont(ofSize: counterLabel.font.pointSize)
        view.addSubview(counterLabel)
        
        // Clickable button
        let button = UIButton(frame: CGRect(x: 0, y: 20, width: 380, height: 80))
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        view.addSubview(button)
        
        // Button image
        let addItemButton = UIImageView(frame: CGRect(x: 82.5, y: 60, width: 215, height: 44))
        addItemButton.image = UIImage.init(named: "AddItem_Button")
        view.addSubview(addItemButton)
        
        // Move button
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            button.firstBaselineAnchor.constraint(equalTo: view.firstBaselineAnchor)
            ])
        
        // init views
        updateViews()
        
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
        AppRepositories.shared.shopping.store(Item("New item #\(addedItemsCounter)"))
        addedItemsCounter += 1
        
    }
    
    /* UITableViewDelegate implementation */
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        item.set(completed: true)
        AppRepositories.shared.shopping.update(item)
        
    }
    
    /* UITableViewDataSource implementation */
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let item = items[indexPath.row]
        let attrString = NSMutableAttributedString(string: item.getName())
        cell.imageView?.tintColor = .black
        
        if (item.isCompleted()) {
            attrString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attrString.length))
            cell.textLabel?.textColor = .gray
            cell.detailTextLabel?.textColor = .gray
            cell.imageView?.tintColor = .gray
            
        }
        cell.textLabel?.attributedText = attrString
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM 'at' HH:mm:ss"
        cell.detailTextLabel?.text = "created on \(formatter.string(from: item.createdAt))"
        cell.imageView?.image = ItemIcon.getIcon(name: item.name)
        
        let itemSize = CGSize.init(width: 25, height: 25)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        cell.imageView?.image!.draw(in: imageRect)
        cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!.withRenderingMode(.alwaysTemplate);
        UIGraphicsEndImageContext();
        
        return cell
        
    }
    
}
