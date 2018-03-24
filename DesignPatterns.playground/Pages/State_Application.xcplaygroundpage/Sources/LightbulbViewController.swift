
import Foundation
import UIKit

public class LightbulbViewController : UIViewController, Observer {
    
    public init () {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    public var delegate: LightbulbDelegate? = nil {
        didSet {
            if delegate is Observable {
                (delegate as! Observable).add(observer: self)
            }
            
        }
    }
    
    private let imageView = UIImageView.init(frame: CGRect.init(x: 150, y: 300, width: 80, height: 80))
    private let nameLabel = UILabel.init(frame: CGRect.init(x: 0, y: 400, width: 380, height: 30))
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.0)
        
        self.title = "Lightbulb"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: nil, action: nil)
        
        view.addSubview(imageView)
        
        nameLabel.textColor = UIColor.init(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 450, width: 380, height: 30))
        button.setTitle("toggle", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: button.titleLabel!.font.pointSize)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        view.addSubview(button)
        
        updateViews()
        
        self.view = view
    }
    
    public func datasetChanged(observable: Observable) {
        updateViews()
        
    }
    
    @objc func handleTap () {
        delegate?.toggle()
        
    }
    
    private func updateViews () {
        guard let delegate = self.delegate else {
            return
            
        }
        
        UIView.transition(with: imageView, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.imageView.image = delegate.getImage()
        }, completion: nil)
        nameLabel.text = delegate.getName()
    }
    
}
