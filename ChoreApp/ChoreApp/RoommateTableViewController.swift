//
//  RoommateTableViewController.swift
//  ChoreApp
//
//  Created by William Wallace on 4/13/19.
//  Copyright © 2019 William Wallace. All rights reserved.
//

import UIKit
import os.log

class RoommateTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var roommates = [Roommate]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSampleRoommates()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.rightBarButtonItem = editButtonItem
        
        if let savedRoommates = loadRoommates() {
            roommates += savedRoommates
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return roommates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RoommateTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RoommateTableViewCell
        else {
            fatalError("Noooooooooo!")
        }
        let roommate = roommates[indexPath.row]
        cell.nameLabel.text = roommate.name

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
            roommates.remove(at: indexPath.row)
            saveRoommates()
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
    
    @IBAction func unwindToRoommateList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? RoommateViewController, let roommate = sourceViewController.roommate {
            
            let newIndexPath = IndexPath(row: roommates.count, section: 0)
            roommates.append(roommate)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
            saveRoommates()
        }
    }
    
    
    
    
    // MARK: Privates
    
    private func loadSampleRoommates() {
        let name1 = "Will"
        let name2 = "Chris"
        let name3 = "Field"
        let name4 = "Zach"
        let r1 = Roommate(name: name1)
        let r2 = Roommate(name: name2)
        let r3 = Roommate(name: name3)
        let r4 = Roommate(name: name4)
        roommates += [r1, r2, r3, r4]
    }
    
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    private func saveRoommates() {
        var namesText = ""
        let fileURL = Roommate.ArchiveURL

        for Roommate in roommates {
            namesText += Roommate.name
            namesText += "\n"
        }
        do {
            try namesText.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("failed with error: \(error)")
        }
        
    }
            
           

    
    private func loadRoommates() -> [Roommate]?  {
        let fileURL = Roommate.ArchiveURL
        do {
            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            
            var loadedRoommates = [Roommate]()
            
            text2.enumerateLines { line, _ in
                let loadedRoommate = Roommate(name: line)
                loadedRoommates.append(loadedRoommate)
            }
            
            return loadedRoommates
            
            
            
            
        }
        catch {
            print("failed with error: \(error)")
            return [Roommate]()
        }
        
    }
    
}
