//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print("lets start some practice on basic swift functions")
func practice(arg:Int)->Int{     //basic function
    return arg*arg
}

print (practice(arg:50)) //see in this case we need to add arg while calling ie we call by arg:value as in we provide key value pair 
func practice2(_ arg:Int,_ arg1:String)->Int{  //see by prefixing "_ "in the arguements allow you to just mention the arguements just as values not the key value pair as given before
    print(arg1)
    return arg*2
}
print(practice2(50,"nipun"))
//FUNCTION return multiple values
func returnmulti(_ a:Int)->(b:Int,c:Int)   //for multiple return a list of variables
{
    return(a,a*5)
}
let result=returnmulti(2)
print (result.c)
//Function multiple arguements 
func multiarg(_ members:Any...)->Int?
{
    for i in members
    {
        print(i)
    }
    return nil
}
multiarg(5,"wow",4,"hahah")
//trying to create a swap function 
func swapit(_ a:inout Int,_ b:inout Int)//you will see that you were not able assign any value to a and b that is by default arguements are constant
{
    let t=a
    a=b
    b=t
}
var m=3
var n=4
swapit(&m,&n)
print ("the value of varibale m is \(m)")
print ("the value of varibale n is \(n)")
//the values were swapped thus inout is analogous to pointer in other languages


