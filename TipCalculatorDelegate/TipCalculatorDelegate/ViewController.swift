//
//  ViewController.swift
//  TipCalculatorDelegate
//
//  Created by iStudents on 2/13/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxPctSlider: UISlider!
    @IBOutlet weak var taxPctLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let tipCalc=TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int,(tipAmt:Double,total:Double)>()
    var sortedKeys:[Int]=[]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return sortedKeys.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexpath: NSIndexPath!) -> UITableViewCell! {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        let tipPct = sortedKeys[indexpath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format: "Tip: $%0.2f, Total: $%0.2f", tipAmt,total)
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }

    
    @IBAction func calculateTapped(sender: AnyObject) {
        //1
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        //2
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = sorted(Array(possibleTips.keys))
        tableView.reloadData()
    }
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value)/100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    
    func refreshUI(){
        //1
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        //2
        taxPctSlider.value = Float(tipCalc.taxPct)*100.0
        //3
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        //4
        
    }


}

