//
//  ViewController.swift
//  Todoey
//
//  Created by Robson Adorno on 20/02/19.
//  Copyright © 2019 Mrs Fantasy. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    //MARK: Constants
    let defaults = UserDefaults.standard
    
    //MARK: Variables
    var arrayList = ["HOLA", "Q", "TAL"]
    var dataAlert:String?
    
    //MARK: LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
            arrayList = items
        }
    
        }
    
    //MARK: Action methods
    @IBAction func btnAdd(_ sender: Any) {
        
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

            self.arrayList.append(textField.text!)
            
            self.defaults.set(self.arrayList, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
    
}

extension TodoListViewController{
    
    //MARK: Methods DataSource of table view
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath)
        
        cell.textLabel?.text = arrayList[indexPath.row]
        
        return cell
    }
    
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    //MARK: Tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

