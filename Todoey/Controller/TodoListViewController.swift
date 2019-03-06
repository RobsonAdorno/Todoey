//
//  ViewController.swift
//  Todoey
//
//  Created by Robson Adorno on 20/02/19.
//  Copyright © 2019 Mrs Fantasy. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    //MARK: Singleton Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //MARK: Constants
    let defaults = UserDefaults.standard
    
    //MARK: Variables
    var arrayList = [Item]()
    var dataAlert:String?
    
    //MARK: LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        }
    
    //MARK: Action methods
    @IBAction func btnAdd(_ sender: Any) {
        
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

         let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            
            self.saveItem()
            
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Save method
    func saveItem(){
        
        do{
            try context.save()
        }catch let error as NSError{
            
            print("Error to save context. Details: \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadItems(){
        
    }
}

extension TodoListViewController{
    
    //MARK: Methods DataSource of table view
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath)
        
        let item = arrayList[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    //MARK: Tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       arrayList[indexPath.row].done = !arrayList[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

