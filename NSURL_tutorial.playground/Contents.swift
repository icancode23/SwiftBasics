//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//PROCESSING A GET REQUEST AT LOCAL PHP SCRIPT
//var str = "Hello, playground"
//print (str)

let todoEndpoint: String = "http://192.168.1.16/json.php?name=nipun&age=19"
let url1 = URL(string: todoEndpoint)
let urlRequest = URLRequest(url: url1!)

// set up the session
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
// make the request
let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
    // do stuff with response, data & error here
    print(error)
    let JSON=try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] ///Extracting json data
    print (JSON!!["name"]!)
    //from here you can dispatch async to get the main thread and perform the changes in the UI
})
task.resume()


//POST REQUESTS USING URLSESSION
let parameters:[String:String] = ["name": "nipun", "passwo": "test"]

//create the url with NSURL
let url=URL(string: "http://192.168.1.16/json.php")

//create the session object
let session1 = URLSession.shared

//now create the NSMutableRequest object using the url object
var request=URLRequest(url: url! as URL)
request.httpMethod = "POST" //set http method as POST

do {
    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)// convert swift dictionary to json
//    let responseString2 = NSString(data: request.httpBody!, encoding: String.Encoding.utf8.rawValue)
//
//    print(responseString2!)
    
} catch let error {
    print(error.localizedDescription)
}

//HTTP Headers
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.addValue("application/json", forHTTPHeaderField: "Accept")
let posttask = session1.dataTask(with: request, completionHandler: { (data, response, error) in
    //print (response)
    print("this is post request ")
    //let responseis=try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    print(responseString)
})
posttask.resume()

