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

   
    //Properties
    var lists = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve sel ection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let listDetailViewController = segue.destination as? StudentsTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? StudentTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedMeal = lists[indexPath.row]
            listDetailViewController.lists = [selectedMeal]
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
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
}
