// Playground - noun: a place where people can play

import UIKit

class funnyZooArray {
    let inputAnimal: String
    let animal: Array<String> = ["Elephant","Monkey","Ant"]
    let feed: Array<String> = ["banana","rice","apple"]
    
    init (inputAnimal:String){
        self.inputAnimal=inputAnimal
    }
    
    func zoo() -> String{
        let strFeed:String = " "
        for(var i=0;i<animal.count;i++){
            //let inputAnimal=animal[i]
            if(inputAnimal==animal[i]){
                let strFeed=feed[i]
                println("\(inputAnimal) : \(strFeed)")
            }
        }
        return strFeed
    }
}
let test = funnyZooArray(inputAnimal: "Ant")
test.zoo()
