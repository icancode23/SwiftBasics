//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Creating a base class
class sample
{
    var t2:Int
    init()
    {
    t2=6
    }
    
}
let s=sample()
print (s.t2)
//Setting up some access specifiers 
class samplero
{
    private var t2:Int
    init()
    {
        t2=6
    }
    
}
let s2=samplero()
//print (s2.t2)this line would result in an error because we have made it protected....other type specifiers available are public and internal
//METHODs..By default all variables and methods are public in swift
class classmethods
{
    private var cm1:Int
    init()
    {
        self.cm1=5  //self in swift as well as python is analogous to the "this" pointer in c++
        //also to remind you that there are no pointers in swift 
        
    }
    func showcm()
    {
        print ("the value is the private variable is \(cm1)")
    }
}
let g=classmethods()
g.showcm()
//print (g.cm1) not possible as cm1 is private 
//SHOWING INHERITANCES
class baseclass
{
    private var th:Int
    init()
    {
        th=10
    }
    internal func state()
    {
    print ("this was printed from the super class")
    }
}
class derivedclass:baseclass
{
    var k:Int
    override init()   //override the constructor because the name is init and its not unique as it used to be in c++ thus we have to override it here as two init can not be at the same place
    {
        k=5 //you need to be initialising the self members first
        super.init()
        
        
    }
    
    
}
let test=derivedclass()
test.state()
//DEMONSTRATION OF OVERRIDING
class baseclass1
{
    private var th:Int
    init()
    {
        th=10
    }
    internal func state()
    {
        print ("this was printed from the super class")
    }
}
class derivedclass1:baseclass1
{
    var k:Int
    override init()
    {
        k=5
        super.init()
        
        
    }
    override func state()
    {
        print("hey this was printed from an overridden method in the derivedclass")
    }
    
    
    
}
let y=derivedclass1()
y.state()
//Demonstrating the use of extensions
extension derivedclass1
{
    func showup()
    {
        print("this was printed from the extension ")  //this function is now added to the class with the name same as its own can be done to  any thing such as the INT class etc for more info https://www.hackingwithswift.com/read/24/2/creating-a-swift-extension
    }
}
y.showup()


//Demonstrating mutating function using the same concept of extension ..|| also shows that you can have more tan one extension
extension derivedclass1
{
 func changeit()     //thus we see that mutating cannot be applied to a class we can apply it only to struct methods thus an added advantage of structs 
 {
    self.k=10
    }
}
y.changeit()
print(y.k)