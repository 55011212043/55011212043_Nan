// Playground - noun: a place where people can play

import UIKit

class funnyZoo {
    let animal: String
    
    let zoo:[String: String]=["Ant":"rice", "Elephant":"banana", "Monkey":"banana"]
    
    init(animal:String){
        self.animal = animal
        
    }
    
    func zooAnimal() -> String{
        let feed:String = " "
        for (key,value) in zoo {
            //let animal=key
            if(key==animal){
                
                let feed=value
                println("\(animal) : \(feed)")
            }
        }
        return feed
    }
    
}
let test = funnyZoo(animal: "Ant");

test.zooAnimal()
