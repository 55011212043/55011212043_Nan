//
//  calculatenumber.swift
//  Extra_practict
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import Foundation
class calculatenumber{
    var sum1=0, sum2=0, sum3=0
    
    func oneCal(num1:Int)->Int{
        
        let num1 = num1+1
         sum1 = sum1+num1
        return sum1
        
    }
    
    func twoCal(num2:Int)->Int{
        let num2 = num2+1
        sum2 = sum2+num2
        return sum2
    }
    
    func threeCal(num3:Int)->Int{
        let num3 = num3+1
        sum3 = sum3+num3
        return sum3
    }
}