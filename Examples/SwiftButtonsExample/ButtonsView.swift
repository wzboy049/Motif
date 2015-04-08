//
//  ButtonsView.swift
//  SwiftButtonsExample
//
//  Created by Eric Horacek on 3/15/15.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

import UIKit
import Cartography

class ButtonsView: UIView {
    
    // MARK: - UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(saveButton)
        addSubview(deleteButton)
        
        saveButton.setTitle("Save", forState: UIControlState.Normal)
        deleteButton.setTitle("Delete", forState: UIControlState.Normal)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        // Workaround for a strange UIKit bug causing UIButton to not update its
        // intrinsic size and autolayout deciding it has a height of 0.0
        self.layoutIfNeeded()
    }
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        constrain(saveButton) { view in
            view.right == view.superview!.centerX - (self.ButtonPadding / 2)
            view.centerY == view.superview!.centerY
            view.width == self.ButtonWidth
        }
        
        constrain(deleteButton) { view in
            view.left == view.superview!.centerX + (self.ButtonPadding / 2)
            view.centerY == view.superview!.centerY
            view.width == self.ButtonWidth
        }
    }
    
    // MARK: - UIView: NSCoding
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ButtonsView
    
    let saveButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let deleteButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    let ButtonWidth = 145.0;
    let ButtonPadding = 10.0;
    
}
