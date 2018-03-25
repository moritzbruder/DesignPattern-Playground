import Foundation
import UIKit

public class TabBarController : UITabBarController {
    
    public override func viewDidLoad() {
        let con1 = ShoppingListViewController(completedOnly: true)
        con1.tabBarItem = UITabBarItem.init(title: "Completed", image: UIImage(named: "completed"), selectedImage: UIImage(named: "completed_filled"))
        con1.title = "Completed"
        
        let con2 = ShoppingListViewController(completedOnly: false)
        con2.tabBarItem = UITabBarItem.init(title: "All", image: UIImage(named: "all"), selectedImage: UIImage(named: "all_filled"))
        con2.title = "All"
        
        viewControllers = [con1, con2].map { UINavigationController(rootViewController: $0) }
    }
    
}
