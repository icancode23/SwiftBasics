//
//  ViewController.swift
//  Orient
//
//  Created by nipun arora on 05/01/17.
//  Copyright © 2017 nipun arora. All rights reserved.
//

import CoreBluetooth
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate,CBPeripheralManagerDelegate
{
    var centralManager: CBCentralManager?
    var peripheralManager:CBPeripheralManager!
    var peripherals: Array<CBPeripheral> = Array<CBPeripheral>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Initialise CoreBluetooth Central Manager
        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    @IBAction func startAdvertising(_ sender: AnyObject) {
        
        let advertisementData = [CBAdvertisementDataLocalNameKey: "nipun"]
        peripheralManager.startAdvertising(advertisementData)
        
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Advertisement was started"
        self.view.addSubview(label)
        
    
        
        
    
    }
    //peripheral delegate methodss
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager)
    {
    print("state:\(peripheral.state)")
    }
    @nonobjc func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager, error: NSError?)
    {
        if let error = error {
            print("Failed… error: \(error)")
            return
        }
        print("Succeeded!")
    }
    
    
    //CoreBluetooth methods
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        if (central.state == CBManagerState.poweredOn)
        {
//            self.centralManager?.scanForPeripherals(withServices: nil, options: nil)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: 160, y: 285)
            label.textAlignment = .center
            label.text = "Bluetooth was turned on"
            self.view.addSubview(label)
            

            
        }
        else
        {
            // do something like alert the user that ble is not on
        }
    }
    
    @nonobjc func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber)
    {
        peripherals.append(peripheral)
        tableView.reloadData()
    }
    
    
    //UITableView methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let peripheral = peripherals[indexPath.row]
        cell.textLabel?.text = peripheral.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return peripherals.count
    }
}
