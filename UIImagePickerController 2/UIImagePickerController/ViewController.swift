//
//  ViewController.swift
//  UIImagePickerController
//
//  Created by iStudents on 4/3/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit
import MobileCoreServices
import AssetsLibrary

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var sliderDisplay: UISlider!
    
    var imagePicker: UIImagePickerController!
    var newMedia: Bool?
    var beginImage: CIImage!
    var context: CIContext!
    var orientation: UIImageOrientation = .Up
    var filter: CIFilter!
    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBAction func takePhoto(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .Camera
        imagePicker.mediaTypes = [kUTTypeImage as NSString]
        presentViewController(imagePicker, animated: true, completion: nil)
        
        newMedia = true
    }
    
    
    
    @IBAction func library(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as NSString]
        presentViewController(imagePicker, animated: true, completion: nil)
        
        newMedia = false
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
        
        beginImage = CIImage(image: gotImage)
        orientation = gotImage.imageOrientation
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        self.sliderChange(sliderDisplay)
        
        let mediaType = info[UIImagePickerControllerMediaType] as NSString
        if(mediaType.isEqualToString(kUTTypeImage as NSString)){
            let image = info[UIImagePickerControllerOriginalImage] as UIImage
            imageView.image = image
            
            if(newMedia == true){
                UIImageWriteToSavedPhotosAlbum(image, self, "image: didFinishSavingWithError: contextInfo:", nil)
            }
        }
        
    }
    
    func image(image: UIImage,didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafePointer<Void>){
        if(error != nil){
            let alert = UIAlertController(title: "Save Failed", message: "Failed to save image", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func sliderChange(sender: UISlider) {
        let sliderValue = sender.value
        let outputImage = self.oldPhoto(beginImage, withAmount: sliderValue)
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        let newImage = UIImage(CGImage: cgimg, scale: 1, orientation: orientation)
        self.imageView.image = newImage
        
    }
    
    func oldPhoto(img: CIImage,withAmount intensity: Float)->CIImage{
        //1
        let sepia = CIFilter(name: "CISepiaTone")
        sepia.setValue(img, forKey: kCIInputImageKey)
        sepia.setValue(intensity, forKey: "inputIntensity")
        
        //2
        let random = CIFilter(name: "CIRandomGenerator")
        
        //3
        let lighten = CIFilter(name: "CIColorControls")
        lighten.setValue(random.outputImage, forKey: kCIInputImageKey)
        lighten.setValue(1 - intensity, forKey: "inputBrightness")
        lighten.setValue(0, forKey: "inputSaturation")
        
        //4
        let croppedImage = lighten.outputImage.imageByCroppingToRect(beginImage.extent())
        
        //5
        let composite = CIFilter(name: "CIHardLightBlendMode")
        composite.setValue(sepia.outputImage, forKey: kCIInputImageKey)
        composite.setValue(croppedImage, forKey: kCIInputBackgroundImageKey)
        
        
        //6
        let vignette = CIFilter(name: "CIVignette")
        vignette.setValue(composite.outputImage, forKey: kCIInputImageKey)
        vignette.setValue(intensity * 2, forKey: "inputIntensity")
        vignette.setValue(intensity * 30, forKey: "inputRadius")
        
        //7
        return vignette.outputImage

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filter = CIFilter(name: "CISepiaTone")
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(0.5, forKey: kCIInputIntensityKey)
        let outputImage = filter.outputImage
        
        context = CIContext(options: nil)
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

