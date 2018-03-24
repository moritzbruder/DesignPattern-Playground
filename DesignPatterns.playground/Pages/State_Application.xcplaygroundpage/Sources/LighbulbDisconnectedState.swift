import Foundation
import UIKit

// This is a so-called "concrete state" implementation, as it represents a specific state (in this case, the lightbulb is not connected)
public class LightbulbDisconnectedState : LightbulbState {
    
    private let context: LightbulbContext
    
    public init (context: LightbulbContext) {
        self.context = context
        
    }
    
    public func getImage() -> UIImage {
        return UIImage.init(named: "image/disconnected")!
        
    }
    
    public func toggle() {
        let alert = UIAlertController(title: "Not reachable", message: "There is currently no connection to your lightbulb. Please try again later!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.context.getViewController().present(alert, animated: true)
        
    }
    
}
