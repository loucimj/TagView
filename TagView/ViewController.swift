//
//  ViewController.swift
//  TagView
//
//  Created by Javier Loucim on 1/12/15.
//  Copyright © 2015 FuzeIdea. All rights reserved.
//

import UIKit

class ViewController: UIViewController,TagViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tag = TagView.initFromNib()
        tag.frame = CGRectMake(40, 40, 150, 25)
        tag.quantity.text = "2"
        tag.label.text = "Javascript"
        tag.updateView()
        tag.delegate = self
        
        let tag2 = TagView.initFromNib()
        tag2.frame = CGRectMake(40, 70, 120, 25)
        tag2.quantity.text = "2"
        tag2.label.text = "Swift"
        tag2.updateView()
        tag2.delegate = self
        
        self.view.addSubview(tag)
        self.view.addSubview(tag2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - TagViewDelegate 
    
    func tagHasBeenSelected(tagView: TagView) {
        print("selected \(tagView.label.text)")
    }
    
    func tagHasBeenUnselected(tagView: TagView) {
        print("UNselected \(tagView.label.text)")

    }
    
    
    
}

