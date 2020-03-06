//
//  ViewController.swift
//  ToDoey
//
//  Created by Home Computer on 05/03/2020.
//  Copyright © 2020 Home Computer. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "Professor"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "Tokyo"
        itemArray.append(newItem2)
        
        
        let newItem3 = Item()
        newItem.title = "Berlin"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem.title = "Rio"
        itemArray.append(newItem4)
        
        let newItem5 = Item()
        newItem.title = "Denver"
        itemArray.append(newItem5)
        
        let newItem6 = Item()
        newItem.title = "Oslo"
        itemArray.append(newItem6)
        
        let newItem7 = Item()
        newItem.title = "Moscow"
        itemArray.append(newItem7)
        
        
        let newItem8 = Item()
        newItem.title = "Helseinki"
        itemArray.append(newItem8)
        
        let newItem9 = Item()
        newItem.title = "Nairobi"
        itemArray.append(newItem9)
        
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
                 itemArray = items
       }
    }

    //MARK - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
    
        //Ternary operator ==>
        //value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController.init(title: "Add New ToDoey Item", message: "", preferredStyle:.alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {  (action) in
            //What will happen once the user clicks the Add button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

}

