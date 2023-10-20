//
//  WatchSession.swift
//  MyAppleWatchCompanionApp Watch App
//
//  Created by Giovanni Tjahyamulia on 20/10/23.
//

import Foundation

// 1. import
import WatchConnectivity

class WatchSession: NSObject, ObservableObject {
    // 5. initialize published variable to get data
    @Published var receivedData: String = "Haven't receive any data"
    
    // 2. init
    override init() {
        super.init()
        
        WCSession.default.delegate = self
        WCSession.default.activate()
    }
    
}

// 3. delegate Watch Session
extension WatchSession: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // do something when active
    }
    
    // 4. receive data
    // a. via Message
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let data = message["key"] as? String {
            self.receivedData = data
        }
    }
    
    // b. via Application Context
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        if let data = applicationContext["key"] as? String {
            receivedData = data
        }
    }
}

