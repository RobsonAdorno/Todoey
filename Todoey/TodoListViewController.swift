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
    
    //MARK: Variables
    var arrayList = ["HOLA", "Q", "TAL"]
    
    //MARK: LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

