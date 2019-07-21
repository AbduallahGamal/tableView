//
//  tableViewController.swift
//  tableView
//
//  Created by Abdalla on 7/21/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController {
    
    struct sport{
        var sportName:String!
        var numofPlayer:Int!
    }
    
    var x:[sport]!
    
    func load() -> [sport]{
        return [sport(sportName: "football", numofPlayer: 11), sport(sportName: "basketball", numofPlayer: 5), sport(sportName: "volleyball", numofPlayer: 6)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        x = load()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return x.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return x[section].numofPlayer
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = (indexPath.row + 1).description
        if x[indexPath.section].sportName == "football"{
            cell.imageView?.image = UIImage(named: "football")
        }
        if x[indexPath.section].sportName == "basketball"{
            cell.imageView?.image = UIImage(named: "basketball")
        }
        if x[indexPath.section].sportName == "volleyball"{
            cell.imageView?.image = UIImage(named: "volleyball")
        }
        
        cell.accessoryType = UITableViewCell.AccessoryType.detailButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return x[section].sportName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //هنا بكتب اسم ال اارااى x.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .left)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
