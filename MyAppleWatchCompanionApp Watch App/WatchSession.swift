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
    // 2. initialize WCSession
    var wcSession: WCSession?
    
    // 7. initialize published variable to get data
    @Published var receivedData: String = "Haven't receive any data"
    
    // 3. init
    override init() {
        super.init()
        
        // 4. WCSession delegate and activate
        wcSession = WCSession.default
        wcSession?.delegate = self
        wcSession?.activate()
    }
    
}

// 5. delegate WCSession
extension WatchSession: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // do something when active
    }
    
    // 6. receive data
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

