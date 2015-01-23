// Playground - noun: a place where people can play

import UIKit

class userPass {
    let user:String
    
    let storeUser:[String: String]=["nan":"1234","chira":"abc123","seungho":"yang1016"]
    init(user:String){
        self.user = user
    }
    
    func showPass() -> String{
        let pass:String = " "
        for(key,value) in storeUser {
            if(key==user){
                let pass=value
                println("\(user) : \(pass)")
            }
        }
        return pass
    }
    
    func updateUser(userEdited:String, passEdited:String){
        storeUser[userEdited] = passEdited
    }
}
let show = userPass(user: "nan")

show.showPass()
show.updateUser("nan",)