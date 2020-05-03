//
//  ProfileViewController.swift
//  IndividualProjectCSC642
//
//  Created by Henok on 4/25/20.
//  Copyright © 2020 Henok. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var Ptable: UITableView!
    
    var data:[String] = ["Name: Henok Kassegn","Major: Computer Science","Classes: CSC642", "Department: Computer Science"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Ptable.dataSource = self
        self.title = "Profile"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProfile))
        self.navigationItem.rightBarButtonItem = addButton
        let barButton_array:[UIBarButtonItem] = [addButton, editButtonItem]
        navigationItem.setRightBarButtonItems(barButton_array, animated: false)
    }
    
    @objc func addProfile(){
        if Ptable.isEditing{
            return
        }
        let name:String = "Enter Course: \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        Ptable.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .purple
        tableView.backgroundColor = .purple
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        Ptable.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        Ptable.deleteRows(at: [indexPath], with: .fade)
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
