// Playground - noun: a place where people can play

import UIKit
class Calculator {
    
    func sumation(n1:Double, n2:Double){
        
        let sum = n1 + n2
        
        println("\(n1) + \(n2) = \(sum)")
    }
    
    func nagative(n1:Double, n2:Double){
        let nag = n1 - n2
        println("\(n1) - \(n2) = \(nag)")
    }
    
    func multiple(n1:Double, n2:Double){
        let mul = n1 * n2
        println("\(n1) * \(n2) = \(mul)")
    }
    
    func division(n1:Double,n2:Double){
        let div = n1 / n2
        println("\(n1) / \(n2) = \(div)")
    }
    
    
}
let test = Calculator()
test.sumation(10, n2: 20)
test.nagative(10, n2: 20)
test.multiple(10, n2: 20)
test.division(10, n2: 20)
