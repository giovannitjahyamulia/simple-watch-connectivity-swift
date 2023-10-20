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
    var watchSession: WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 4. check Watch Session is supported or not
        if (!WCSession.isSupported()) {
            watchSession = nil
            return
        }
        
        // 5. Watch Session delegate and activate
        watchSession = WCSession.default
        watchSession?.delegate = self
        watchSession?.activate()
    }
    
    @IBAction func sendDataFromPhone(_ sender: Any) {
        // 6. create data as dictionary
        let dict: [String: Any] = ["key" : "Data Received"]
        
        // 7. send data to Watch App
        do {
            // a. via Application Context
            try watchSession?.updateApplicationContext(dict)
            
            // b. via Message
            try watchSession?.sendMessage(dict, replyHandler: nil)
            
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
        watchSession?.activate()
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // do something when inactive
        watchSession?.activate()
    }
}
