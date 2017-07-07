//
//  Cloudlet.swift
//  MobileCloud
//
//  Created by Dawand Sulaiman on 20/05/2017.
//  Copyright © 2017 StAndrews. All rights reserved.
//

import Foundation

// used for cloudlet connections
public let CloudletDefaultURL = "192.168.0.15:8080"

public var webSocket: WebSocket!
public var isCloudletConnected = false

public class Cloudlet: NSObject {
    var displayName: String
    var url: URL
    
    init(name: String, cloudletURL: String = CloudletDefaultURL) {
        self.displayName = name
        self.url = URL(string:"ws://\(cloudletURL)/connect")!
        webSocket = WebSocket(url: self.url)
    }
    
    public func send(json: String) {
        print(json)
        webSocket.write(string: json)
    }
    
    func isConnected() -> Bool{
        return webSocket.isConnected
    }
}
