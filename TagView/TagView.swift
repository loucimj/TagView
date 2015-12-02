//
//  TagView.swift
//  TagView
//
//  Created by Javier Loucim on 1/12/15.
//  Copyright © 2015 FuzeIdea. All rights reserved.
//

import UIKit


protocol TagViewDelegate {
    func tagHasBeenSelected(tagView:TagView)
    func tagHasBeenUnselected(tagView:TagView)
}

class TagView: UIView {

//    // Only override drawRect: if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var quantityLabelWidthContraint: NSLayoutConstraint?
    @IBOutlet weak var quantityLabelHeightContraint: NSLayoutConstraint?
    @IBOutlet weak var containerView: UIView!

    var isSelected:Bool = false
    
    var delegate:TagViewDelegate?
    
    var borderColor:UIColor = UIColor.blackColor()
    var textColor:UIColor = UIColor.blackColor()
    var selectedBackgroundColor:UIColor = UIColor.grayColor()
    var quantityBackgroundColor:UIColor = UIColor.lightGrayColor()
    var quantityLabelColor:UIColor = UIColor.whiteColor()
    
    var borderSize:CGFloat = 2
    
    var data:AnyObject?
    
    class func initFromNib() -> TagView {
        
        let view = UINib(nibName: "TagView", bundle: nil).instantiateWithOwner(nil, options: nil).first as! TagView
        
        return view
    }
    
    func setPropertiesFor(tagText:String, quantity: String, borderColor: UIColor, textColor: UIColor, selectedBackgroundColor: UIColor, quantityBackgroundColor: UIColor, quantityLabelColor:UIColor) {
        self.label.text = tagText
        self.quantity.text = quantity
        
        self.borderColor = borderColor
        self.textColor = textColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.quantityBackgroundColor = quantityBackgroundColor
        self.quantityLabelColor = quantityLabelColor
        
        updateView()
    }
    
    func setSelected(value:Bool) {
        isSelected = value
        
        updateView()
    }
    
    func viewHasBeenTapped() {
        if isSelected {
            isSelected = false
        } else {
            isSelected = true
        }
        
        updateView()
        callDelegate()
    }
    
    private func callDelegate() {
        if let _ = delegate {
            if isSelected {
                delegate?.tagHasBeenSelected(self)
            } else {
                delegate?.tagHasBeenUnselected(self)
            }
        }
    }
    
    func updateView() {
        
        print("updating...")
        //set view layout
        let circleSize = self.bounds.height - 6
        quantityLabelHeightContraint?.constant = circleSize
        quantityLabelWidthContraint?.constant = circleSize
        
        self.containerView.layer.cornerRadius = self.bounds.height/2
        self.containerView.layer.borderWidth = borderSize
        
        self.containerView.layer.borderColor = borderColor.CGColor
        if isSelected {
            self.containerView.backgroundColor = borderColor
        } else {
            self.containerView.backgroundColor = UIColor.clearColor()
        }

        //set quantity label
        self.quantity.textColor = quantityLabelColor
        self.quantity.layer.backgroundColor = quantityBackgroundColor.CGColor
        self.quantity.layer.borderColor = quantityBackgroundColor.CGColor
        self.quantity.layer.borderWidth = 1
        self.quantity.layer.cornerRadius = circleSize/2
        
        //set textLabel label
        if isSelected {
            self.label.textColor = UIColor.whiteColor()
        } else {
            self.label.textColor = textColor
        }
        
        self.setNeedsLayout()
        
        let tap = UITapGestureRecognizer(target: self, action: "viewHasBeenTapped")
        
        self.addGestureRecognizer(tap)
        
    }

}
