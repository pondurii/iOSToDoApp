//
//  ViewController.swift
//  ToDoApp
//
//  Created by ponduri on 6/28/18.
//  Copyright © 2018 ponduri. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [String]()

    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       if let  items = defaults.array(forKey: "todolistitems") as? [String]
       {
       itemArray=items
       }
    }

    //MARK- Tableview Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
  
//MARK -Tabelview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none

        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
//MARK -Add new item
    
    @IBAction func AddItemClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add  new Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default ) { (action) in
            //print(textField.text!)
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "todolistitems")
            self.tableView.reloadData()
        }
        alert.addAction(action)
        
        alert.addTextField{ (alerTextField) in
            
        alerTextField.placeholder = "Crete New Item"
        textField = alerTextField
            
        }
        
        
        
        present(alert, animated: true, completion: nil)
    }
}

