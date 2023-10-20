//
//  ContentView.swift
//  MyAppleWatchCompanionApp Watch App
//
//  Created by Giovanni Tjahyamulia on 20/10/23.
//

import SwiftUI
import WatchConnectivity

// import for Just()
import Combine

struct ContentView: View {
    // 1. initialize WatchSession
    @ObservedObject var watchSession = WatchSession()
    
    // 2. set variable to put the data value
    @State private var textValue = ""
    
    var body: some View {
        // 3. initialize Text to show the data
        Text(textValue)
            // 4. set data when receive
            .onReceive(
                Just(watchSession.receivedData).delay(
                        for: 1,
                        scheduler: RunLoop.main
                    )
            )
            { newValue in
                // 5. set text value
                self.textValue = watchSession.receivedData
                
            }
    }
}

#Preview {
    ContentView()
}
