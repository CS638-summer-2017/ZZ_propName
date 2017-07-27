//
//  ViewController.swift
//  propName
//
//  Created by Lijie Zhao on 7/26/17.
//  Copyright © 2017 Lijie Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var properNameView: UITextView!
    var properNames = Names()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        properNameView.text = properNames?.namesString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        properNames?.add(name: textField.text)
        
        properNameView.text = properNames?.namesString
        
        textField.text = ""
        
        // close the keyboard
        textField.resignFirstResponder()
        
        return true;
    }

}

