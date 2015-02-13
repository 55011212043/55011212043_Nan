//
//  ViewController.swift
//  Extra_practict
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var num1=0
    var num2=0
    var num3=0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBAction func oneBT(sender: AnyObject) {
        
        let result=calBT.oneCal(num1)
        label1.text=String(result)
        
        
    }

    @IBAction func twoBT(sender: AnyObject) {
        
        let result=calBT.twoCal(num2)
        label2.text=String(result)
    }

   
    @IBAction func threeBT(sender: AnyObject) {
        
        let result=calBT.threeCal(num3)
        label3.text=String(result)    }
    
    @IBAction func resetBT(sender: AnyObject) {
        label1.text = "0"
        label2.text = "0"
        label3.text = "0"
        calBT.sum1=0
        calBT.sum2=0
       calBT.sum3=0
        
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        label1.resignFirstResponder()
        label2.resignFirstResponder()
        label3.resignFirstResponder()
    }
    let calBT=calculatenumber()
    
    func refreshUI(){
        label1.text = "0"
        label2.text = "0"
        label3.text = "0"
    }
}

