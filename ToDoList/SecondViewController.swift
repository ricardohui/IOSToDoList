//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Ricardo Hui on 3/3/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var itemTextField: UITextField!
    
    
    @IBAction func add(_ sender: Any) {
        let itemObject  = UserDefaults.standard.object(forKey: "items")
       var items: [String]
        if let tempItems = itemObject as? [String]{
            items = tempItems
          
            items.append(itemTextField.text!)
        }else{
            items = [itemTextField.text!]
        }
        
        UserDefaults.standard.set(items,forKey: "items")
        itemTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

