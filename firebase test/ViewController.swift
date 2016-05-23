//
//  ViewController.swift
//  firebase test
//
//  Created by Johnny' mac on 2016/5/23.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var enterText: UITextField!
    let textRef = FIRDatabase.database().reference().child("text")
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.enterText.text = ""
        
        textRef.observeEventType(.Value){(snap:FIRDataSnapshot)in
        self.textField.text = snap.value?.description
        }
    }

    
    @IBAction func touchDidSent(sender: AnyObject) {
     textRef.setValue(enterText.text)
    }
   
    }



