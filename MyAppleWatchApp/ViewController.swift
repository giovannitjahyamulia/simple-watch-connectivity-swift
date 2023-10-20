//
//  ViewController.swift
//  MyAppleWatchApp
//
//  Created by Giovanni Tjahyamulia on 20/10/23.
//

import UIKit

// 1. import
import WatchConnectivity

class ViewController: UIViewController {
    // 2. initialize Watch Session
    var wcSession: WCSession?
    
    func addition(a: Int, b: Int) -> Int {
        return a + b
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 4. check Watch Session is supported or not
        if (!WCSession.isSupported()) {
            wcSession = nil
            return
        }
        
        // 5. Watch Session delegate and activate
        wcSession = WCSession.default
        wcSession?.delegate = self
        wcSession?.activate()
    }
    
    @IBAction func sendDataFromPhone(_ sender: Any) {
        // 6. create data as dictionary
        let dict: [String: Any] = ["key" : "Data Received"]
        
        // 7. send data to Watch App
        do {
            // a. via Application Context
            try wcSession?.updateApplicationContext(dict)
            
            // b. via Message
            try wcSession?.sendMessage(dict, replyHandler: nil)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

// 3. delegate Watch Session
extension ViewController: WCSessionDelegate {
    
    // auto generated function
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // do something when activation complete
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        // do something when will be inactive
        
        // activate when it will be inactive
        wcSession?.activate()
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // do something when inactive
        
        // activate when inactive
        wcSession?.activate()
    }
}
