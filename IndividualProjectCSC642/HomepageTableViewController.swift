//
//  HomepageTableViewController.swift
//  IndividualProjectCSC642
//
//  Created by Henok on 3/22/20.
//  Copyright © 2020 Henok. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomepageTableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    
    var data:[String] = ["Diary:","Annie :Shared her diary","Tom :Shared his diary", " ", " ", "Lecture:", "Joe :Shared his CSC642 lecture", "Betty :Shared her CSC648 lecture " ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.purple

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        table.dataSource = self
        table.delegate = self
        self.title = "Diary"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addDiary))
        //self.navigationItem.backBarButtonItem = addButton
        self.navigationItem.rightBarButtonItem = addButton
        let barButton_array:[UIBarButtonItem] = [addButton, editButtonItem]
        navigationItem.setRightBarButtonItems(barButton_array, animated: false)
        //navigationItem.setLeftBarButtonItems(barButton_array, animated: false)
         addButton.tintColor = UIColor.purple
         editButtonItem.tintColor = UIColor.purple
        load()
    }

    @objc func addDiary() {
        if table.isEditing{
            return
        }
        let name:String = "Diary \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        save()
        //self.performSegue(withIdentifier: "detail", sender: nil)
    }
    // MARK: - Table view data source

    
    @IBAction func logOutTapped(_ sender: Any) {
        try? Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let cell:UITableViewCell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .purple
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
        save()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(data[indexPath.row])")
        self.performSegue(withIdentifier: "detail", sender: nil)
    }

    func save(){
        UserDefaults.standard.set(data, forKey: "Diary")
    }
    
    func load(){
        if let loadedData:[String] = UserDefaults.standard.value(forKey: "Diary")as? [String]{
            data = loadedData
            table.reloadData()
        }
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
