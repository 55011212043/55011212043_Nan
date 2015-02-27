//
//  data.swift
//  customTableView
//
//  Created by iStudents on 2/27/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class data: NSObject {
    func getData() -> Array<balloon> {
        var tempArray = Array<balloon>()
        
        let b1 = balloon(bImage: UIImage(named: "p1.png"), bName: "กระรอก")
        tempArray.append(b1)
        
        let b2 = balloon(bImage: UIImage(named: "p2.png"), bName: "มิกกี้เมาส์")
        tempArray.append(b2)
        
        let b3 = balloon(bImage: UIImage(named: "p3.png"), bName: "เจ้าผีเสื้อ")
        tempArray.append(b3)
        
        let b4 = balloon(bImage: UIImage(named: "p4.png"), bName: "นกฮูก")
        tempArray.append(b4)
        
        let b5 = balloon(bImage: UIImage(named: "p5.png"), bName: "นกฮูกอีกตัว")
        tempArray.append(b5)
        
        let b6 = balloon(bImage: UIImage(named: "p6.png"), bName: "หมาน้อยน่ารัก")
        tempArray.append(b6)
        
        return tempArray
    }
   
}
