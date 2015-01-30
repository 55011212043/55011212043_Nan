// Playground - noun: a place where people can play

import UIKit

class userPass {
    
    
    var storeUser=["nan":"1234","chira":"abc123","seungho":"yang1016"]
    
    
    
    func removeUsr(userRe:String) -> String{
        if(storeUser[userRe] != nil){
            storeUser[userRe]=nil
        }else{
            return "This data is not in storage."
        }
        return userRe
    }
    
    func addUser(userAdd:String,passAdd:String) -> String{
        let user:String = ""
        for(key,value) in storeUser {
            let user=key
        }
        if(userAdd != storeUser[user]){
            storeUser[userAdd]=passAdd
        }else{
            return "This data is Exist."
        }
        return userAdd
    }
    
    func showData(){
        
        println(storeUser)
       
    }
}
let show = userPass()
show.removeUsr("nan")
show.addUser("jjjjj", passAdd: "555")

show.showData()
