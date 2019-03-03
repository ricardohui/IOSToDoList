//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Ricardo Hui on 3/3/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var items: [String] = []
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
 
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @IBOutlet var table: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        
    }
    override func viewDidAppear(_ animated:Bool){
        let itemObject  = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemObject as? [String]{
            items = tempItems
            
        }
        table.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items,forKey:"items")
        }
        
    }


}

