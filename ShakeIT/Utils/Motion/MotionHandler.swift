//
//  MotionHandler.swift
//  ShakeIT
//
//  Created by Kamil Poręba on 03.10.2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import Foundation
import CoreMotion

class MotionHandler {
    static let shared = MotionHandler()
    
    private let motionManager = CMMotionManager()
    private let operations = OperationQueue()
    
    func setDeviceMotionUpdateActionAndInterval(action: @escaping () -> Void)  {
        motionManager.deviceMotionUpdateInterval = 0.02
        motionManager.startDeviceMotionUpdates(to: operations, withHandler: { (deviceMotion, error) in
            guard deviceMotion != nil else {
                print(error.debugDescription)
                return
            }
            self.handleShake(deviceMotion: deviceMotion!, action: action)
        })
    }
    
    private func handleShake(deviceMotion: CMDeviceMotion , action:() -> Void)  {
        if deviceMotion.userAcceleration.x < -2.5 {
            action()
        }
    }
    
    func stopHandleMotion()  {
        motionManager.stopDeviceMotionUpdates()
    }
    
}
