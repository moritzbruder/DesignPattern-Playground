import Foundation
import UIKit

// This is the protocol with our state-dependent functions:
public protocol LightbulbState {
    
    /**
     Returns an image to show in the ViewController
     */
    func getImage () -> UIImage
    
    /**
     Turns the lightbulb on or off
     */
    func toggle ()
    
}
