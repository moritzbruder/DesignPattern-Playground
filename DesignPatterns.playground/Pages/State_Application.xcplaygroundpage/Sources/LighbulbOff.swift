import Foundation
import UIKit

public class LightbulbOffState : LightbulbState {
    
    private let context: LightbulbContext
    
    public init (context: LightbulbContext) {
        self.context = context
        
    }
    
    public func getImage() -> UIImage {
        return UIImage.init(named: "image/light_off")!
        
    }
    
    public func toggle() {
        self.context.set(state: LightbulbOnState(context: self.context))
        
    }
    
}
