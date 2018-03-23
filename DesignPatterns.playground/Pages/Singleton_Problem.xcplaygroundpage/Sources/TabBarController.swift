import Foundation
import UIKit

public class TabBarController : UITabBarController {
    
    public override func viewDidLoad() {
        let rep = Repository<Item>()
        let con1 = ShoppingListViewController()
        con1.tabBarItem = UITabBarItem.init(tabBarSystemItem: .bookmarks, tag: 0)
        con1.set(repository: Repository<Item>())
        con1.title = "Bookmarks"
        
        let con2 = ShoppingListViewController()
        con2.tabBarItem = UITabBarItem.init(tabBarSystemItem: .more, tag: 0)
        con2.tabBarItem.title = "All"
        con2.set(repository: rep)
        con2.title = "All"
        
        rep.store(item: Item("Wowy"))
        
        viewControllers = [con1, con2].map { UINavigationController(rootViewController: $0) }
    }
    
}
