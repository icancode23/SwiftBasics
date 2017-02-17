//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print("hey there \(str)")
var dict:[String:Any]=["orderid":420,"orderelement":"butter"]   //for declaring a heterogeneous dictionary you need to explicitly declare it [String:Any]
dict["price"]=35
for keys in dict.keys
{
    print(keys)
}
for value in dict.values
{
    print (value)
}
var arr:[Any]=[420,"butter"]
arr.append("gurgaon")
print(arr.count)//gives the count of number of elements in an array



