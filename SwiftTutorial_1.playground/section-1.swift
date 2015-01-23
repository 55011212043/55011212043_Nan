// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let totorialTeam=56
let edit=23
var totolTeam = totorialTeam + edit
totolTeam += 1

let printInt = -19
let printExp:Int = -19

let priceInf = -19.99
let priceExp:Double = -19.99

let priceFl = -19.99
let priceFlExp:Float = -19.99

let onSale = true
let onSaleExp:Bool = false

let nameInf = "Chiraphon Thiabchantheuk"
let nameExp:String = "Chiraphon Thiabchantheuk"

var shoppingL = ["Eggs", "Milk"]
var shoppingExp: [String] = ["Eggs", "Milk"]
println("The shopping list contains \(shoppingL.count) items.")
shoppingL.append("Flour")
println(shoppingL)

shoppingL += ["Baking Powder"]
shoppingL += ["chocolate", "Cheese", "Butter"]

var firstItem = shoppingL[0]
shoppingL[0] = "Six eggs"
shoppingL

if (onSale){
    println("\(nameInf) on sale for \(priceInf)!")
}else {
    println("\(nameInf) at regular price: \(priceInf)!")
}


var array1 = ["abc", "bcd", "cdf"]
for (var i=0; i < array1.count; i++ ){
    println(array1[i])
}

var array2 = ["a", "b", "c"]
var ste2 = ""
for str2 in array2 {
    println(str2)
}