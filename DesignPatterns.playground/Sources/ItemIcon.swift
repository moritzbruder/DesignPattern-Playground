import Foundation
import UIKit

public class ItemIcon {
    
    public static func getIcon (name: String) -> UIImage? {
        if (name.lowercased().contains("bread")) {
            return UIImage.init(named: "icon/bread")
            
        } else if (name.lowercased().contains("peanut")) {
            return UIImage.init(named: "icon/peanut")
            
        } else if (name.lowercased().contains("milk")) {
            return UIImage.init(named: "icon/milk")
            
        } else if (name.lowercased().contains("cookie")) {
            return UIImage.init(named: "icon/cookies")
            
        } else if (name.lowercased().contains("tomato")) {
            return UIImage.init(named: "icon/tomato")
            
        } else if (name.lowercased().contains("new")) {
            return UIImage.init(named: "icon/new")
            
        } else {
            return UIImage.init(named: "icon/bag")
            
        }
    }
    
}
