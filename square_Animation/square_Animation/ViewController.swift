//
//  ViewController.swift
//  square_Animation
//
//  Created by iStudents on 3/27/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberOfBirdSlider: UISlider!
    
    @IBAction func animateButton(sender: AnyObject) {
        let numberOfBird = Int(self.numberOfBirdSlider.value)
        for i in 1...numberOfBird {
            
            let duration : NSTimeInterval = 1.0
            let delay : NSTimeInterval = 0.0
            let options = UIViewAnimationOptions.CurveLinear
            
            let size : CGFloat = CGFloat(arc4random_uniform(40))+20
            let yPosition : CGFloat = CGFloat(arc4random_uniform(200))+20
            
            let bird = UIImageView()
            bird.image = UIImage(named: "b.png")
            bird.frame = CGRectMake(0, yPosition, size, size)
            self.view.addSubview(bird)
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations:{
                bird.frame = CGRectMake(320-size, yPosition, size, size)
                },completion: { animationFinished in
                    bird.removeFromSuperview()
            })
            /*let coloredSquare = UIView()
            coloredSquare.backgroundColor = UIColor.blueColor()
            coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
            self.view.addSubview(coloredSquare)
        
            let options = UIViewAnimationOptions.CurveLinear
        
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
            
                coloredSquare.backgroundColor = UIColor.redColor()
                coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
            
                }, completion: { animationFinished in
                    coloredSquare.removeFromSuperview()
                })*/
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*let coloredSquare = UIView()
        coloredSquare.backgroundColor = UIColor.blueColor()
        coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        self.view.addSubview(coloredSquare)
        
        /*UIView.animateWithDuration(1.0, animations: {
            coloredSquare.backgroundColor = UIColor.redColor()
            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
        })*/
        
        /*let duration = 1.0
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveEaseInOut
        let damping = 0.5
        let velocity = 1.0*/
        
        //let options = UIViewAnimationOptions.CurveEaseInOut
        //let options = UIViewAnimationOptions.Autoreverse
        let options = UIViewAnimationOptions.Repeat
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
            
            coloredSquare.backgroundColor = UIColor.redColor()
            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
            
            }, completion: nil)*/
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

