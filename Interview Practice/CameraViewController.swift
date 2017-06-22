//
//  CameraViewController.swift
//  Interview Practice
//
//  Created by Lu Ao on 6/22/17.
//  Copyright © 2017 Lu Ao. All rights reserved.
//

import UIKit


class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func takePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagepicker = UIImagePickerController()
            imagepicker.delegate = self
            imagepicker.sourceType = UIImagePickerControllerSourceType.camera
            imagepicker.showsCameraControls = true
            imagepicker.allowsEditing = true
            present(imagepicker, animated: true, completion: nil)
        }
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        self.dismiss(animated: true, completion: nil)
        
        if mediaType.isEqual(to: "kUTTypeImage" as String) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = image
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
            
        }

    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer) {
        
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                                          message: "Failed to save image",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true,
                         completion: nil)
        }
    }

}
