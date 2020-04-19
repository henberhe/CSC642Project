//
//  SelectPictureViewController.swift
//  IndividualProjectCSC642
//
//  Created by Henok on 4/10/20.
//  Copyright © 2020 Henok. All rights reserved.
//

import UIKit
import FirebaseStorage

class SelectPictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    var imagePicker: UIImagePickerController?
    var imageAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        if imagePicker != nil{
            imagePicker!.sourceType = .camera
            present(imagePicker!, animated: true, completion: nil)
        }
    }
    
    @IBAction func selectPhotoTapped(_ sender: Any) {
        if imagePicker != nil{
            imagePicker!.sourceType = .photoLibrary
            present(imagePicker!, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ImageView.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        /*if let message = messageTextField.text{
            if imageAdded && message != ""{
                //Segue to next view Controller
            } else {
                //Picture or text field is messing
                let alertVC = UIAlertController(title: "Error", message: "Please provide an image and a note for your course diary", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default) {
                    (action) in alertVC.dismiss(animated: true, completion: nil)
                }
                alertVC.addAction(okAction)
                present(alertVC, animated: true, completion: nil)
            }
        }*/
        
        
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
