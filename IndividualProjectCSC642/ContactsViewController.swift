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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
