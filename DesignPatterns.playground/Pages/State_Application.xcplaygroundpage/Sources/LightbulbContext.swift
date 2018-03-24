import Foundation
import UIKit

public class LightbulbContext: Observable, LightbulbDelegate {
    
    private var state: LightbulbState!
    private var viewController: UIViewController!
    
    public init (viewController: UIViewController) {
        super.init()
        self.state = LightbulbOnState(context: self)
        self.viewController = viewController
        
    }
    
    public func set(state: LightbulbState) {
        self.state = state
        self.notifyDatasetChanged()
        
    }
    
    public func getImage() -> UIImage {
        return state.getImage()
        
    }
    
    public func toggle() {
        state.toggle()
        
    }
    
    public func getName() -> String {
        return "Kitchen light 1"
        
    }
    
    public func getViewController () -> UIViewController {
        return self.viewController
    
    }
    
}
