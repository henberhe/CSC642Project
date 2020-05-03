//
//  DetailViewController.swift
//  IndividualProjectCSC642
//
//  Created by Henok on 5/2/20.
//  Copyright © 2020 Henok. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var text:String = ""
    //var masterView:ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //textView.text = "New Diary"
        textView.text = text
    }
    
    func setText(t:String){
        text = t
        if isViewLoaded{
            textView.text = t
        }
        
    }

   // override func viewWillDisappear(_ animated: Bool) {
     //   super.viewWillDisappear(animated)
       // masterView.newRowText = textView.text
       // masterView.newRowText = textView.text
        
    //}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
