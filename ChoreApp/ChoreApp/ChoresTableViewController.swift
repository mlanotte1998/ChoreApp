//
//  ChoresTableViewController.swift
//  ChoreApp
//
//  Created by William Wallace on 4/13/19.
//  Copyright © 2019 William Wallace. All rights reserved.
//

import UIKit

class ChoreTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var chores = [Chore]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSampleRoommates()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ChoreTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChoreTableViewCell
            else {
                fatalError("Noooooooooo!")
        }
        let chore = chores[indexPath.row]
        cell.nameLabel.text = chore.name
        
        // Configure the cell...
        
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            chores.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    
    // MARK: Actions
    
    @IBAction func unwindToChoreList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ChoreViewController, let chore = sourceViewController.chore {
            
            let newIndexPath = IndexPath(row: chores.count, section: 0)
            chores.append(chore)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

}
