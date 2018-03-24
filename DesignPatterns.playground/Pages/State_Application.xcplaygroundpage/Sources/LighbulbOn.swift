import Foundation
import UIKit

public class LightbulbOnState : LightbulbState {
    
    private let context: LightbulbContext
    
    public init (context: LightbulbContext) {
        self.context = context
        
    }
    
    public func getImage() -> UIImage {
        return UIImage.init(named: "image/light_on")!
        
    }
    
    public func toggle() {
        self.context.set(state: LightbulbOffState(context: self.context))
        
    }
    
}
