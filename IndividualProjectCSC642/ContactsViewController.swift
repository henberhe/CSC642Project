//
//  ContactsViewController.swift
//  IndividualProjectCSC642
//
//  Created by Henok on 4/26/20.
//  Copyright © 2020 Henok. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var Ctable: UITableView!
    
    var data:[String] = ["Joe Ford","Henry King","Annie Wong","Betty Mark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Ctable.dataSource = self
        self.title = "Contacts"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addName))
        self.navigationItem.rightBarButtonItem = addButton
        //self.navigationItem.leftBarButtonItem = editButtonItem
        let barButton_array:[UIBarButtonItem] = [addButton, editButtonItem]
        navigationItem.setRightBarButtonItems(barButton_array, animated: false)
        
    }
    
    @objc func addName() {
        if Ctable.isEditing{
            return
        }
        let name:String = "Enter Name: \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        Ctable.insertRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .purple
        tableView.backgroundColor = .purple
        return cell
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        Ctable.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        Ctable.deleteRows(at: [indexPath], with: .fade)
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
