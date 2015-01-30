// Playground - noun: a place where people can play

import UIKit

class funnyZooArray {
    
    var animal = ["Elephant","Monkey","Ant"]
    var feed = ["banana","rice","apple"]
    
    
    

    func addAnimal(animalAdd: String) -> String {
        
        animal.append(animalAdd)
        return animalAdd
    }
    
    func addFeed(feedAdd:String) -> String {
        feed.append(feedAdd)
        return feedAdd
    }
    
    func FeedForAnimal(inputAnimal:String, inputFeed:String){
        
        for(var i=0;i<animal.count;i++){
            if(inputAnimal==animal[i]){
                println("\(inputAnimal) : \(inputFeed)")
            }else{
                println("This Data is not in Array")
            }
        }
    }
    
    func showData(){
        for(var j=0;j<animal.count;j++){
            println((animal[j]))
        }
    }
}

let test = funnyZooArray( )

test.addAnimal("Dog")
test.addFeed("mango")

test.FeedForAnimal("Dog",inputFeed: "banana")

test.showData()




