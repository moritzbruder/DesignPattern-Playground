import Foundation
import UIKit

public protocol LightbulbDelegate {
    
    /**
     Returns an image to show in the ViewController
     */
    func getImage () -> UIImage
    
    /**
     Turns the lightbulb on or off
     */
    func toggle ()
    
    /**
     Returns the friendly name of this lightbulb
     */
    func getName () -> String
    
}
