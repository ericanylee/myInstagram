//
//  takePhotoController.swift
//  myInstagram
//
//  Created by Erica Lee on 3/6/16.
//  Copyright © 2016 Erica Lee. All rights reserved.
//

import UIKit

class takePhotoController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var caption: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func uploadTapped(sender: AnyObject) {
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .ActionSheet)

        //two options, one is to take a picture
        let takePic = UIAlertAction(title: "Take a picture", style: .Default) { (action) -> Void in
            //from CodePath
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = UIImagePickerControllerSourceType.Camera
            
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
        let cameraRoll = UIAlertAction(title: "From Camera roll", style: .Default) { (action) -> Void in
            //from CodePath
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            self.presentViewController(vc, animated: true, completion: nil)
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(cancel)
        alertController.addAction(takePic)
        alertController.addAction(cameraRoll)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    
    }
    
    //fromCodePath
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func imagePickerController(picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject]) {

            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
            let size = CGSizeMake(270,270)
            let editedImage = resize(originalImage, newSize: size)
            // Do something with the images (based on your use case)
            uploadButton.setBackgroundImage(editedImage, forState: .Normal)
            uploadButton.setTitle("", forState: .Normal)

            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func UploadTapped(sender: AnyObject) {
        if uploadButton.backgroundImageForState(.Normal) != nil {
            Post.postUserImage(uploadButton.backgroundImageForState(.Normal), withCaption: caption.text, withCompletion: { (success, error) -> Void in
                NSNotificationCenter.defaultCenter().postNotificationName("photoPosted", object: nil)
                self.dismissViewControllerAnimated(true, completion: nil)
        })
        }
    }

    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
