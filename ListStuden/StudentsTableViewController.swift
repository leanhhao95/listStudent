//
//  StudentsTableViewController.swift
//  ListStuden
//
//  Created by thang on 8/14/17.
//  Copyright © 2017 thang. All rights reserved.
//
import os.log
import UIKit

class StudentsTableViewController: UITableViewController {
    
    
    @IBOutlet var noData: UIView!
    @IBOutlet var footer: UIView!
    
    //Properties
    var lists = [List]()
    var kCoDuLieu : Bool = false {
        didSet {
            guard kCoDuLieu != oldValue else {
                return
            }
            if kCoDuLieu == true {
                tableView.tableFooterView = noData
            } else {
                tableView.tableFooterView = UIView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        kCoDuLieu = lists.isEmpty
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? StudentTableViewCell else {
            fatalError("error")
        }
        let list =  lists[indexPath.row]
        cell.listnameLabel.text = list.name
        cell.listageLabel.text = list.age
        cell.listPhoneLabel.text = list.phone
        return cell
    }
    
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let listDetailViewController = segue.destination as? StudentsTableViewController else {
                fatalError("")
            }
            
            guard let selectedListCell = sender as? StudentTableViewCell else {
                fatalError("")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedListCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedList = lists[indexPath.row]
            listDetailViewController.lists = [selectedList]
            
        default:
            fatalError("")
        }
    }
    //MARK: Private methods
    
    //MARK: Actions
    @IBAction func unwindToList(sender : UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ListViewController , let list = sourceViewController.list {
            
            // Add a new student
            let newIndexPath = IndexPath(row: lists.count, section: 0)
            
            lists.append(list)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            kCoDuLieu = lists.isEmpty
        }
     
    }
}
