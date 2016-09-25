//
//  ShakeIT.swift
//  ShakeIT
//
//  Created by Kamil Poręba on 24.09.2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

public class ShakeIT {
    
    let emailAddress: String!
    let motionManager = CMMotionManager()
    let operations = OperationQueue()
    let alertWindow = UIWindow(frame: UIScreen.main.bounds)
    var shouldShow = true
    
    public init(emailAddress: String) {
        self.emailAddress = emailAddress
    }
    
    private func  startHandleDeviceMotion()  {
        setDeviceMotionUpdateActionAndInterval()        
    }
    
    private func setDeviceMotionUpdateActionAndInterval()  {
        motionManager.deviceMotionUpdateInterval = 0.02
        motionManager.startDeviceMotionUpdates(to: operations, withHandler: { (deviceMotion, error) in
            guard deviceMotion != nil else {
                print(error.debugDescription)
                return
            }
            self.handleShake(deviceMotion: deviceMotion!)
        })
    }
    
    private func handleShake(deviceMotion: CMDeviceMotion)  {
        if deviceMotion.userAcceleration.x < -2.5 {
            guard self.shouldShow else {
                return
            }
            self.showNoteViewControllerAndBlockShakeHandler()
        }
    }
    
    private func showNoteViewControllerAndBlockShakeHandler()  {
        DispatchQueue.main.async {
            self.shouldShow = false
            self.showNoteViewController(animated: false)
        }
    }
    
    private func showNoteViewController(animated: Bool) {
        let noteViewController  = NoteViewController()
        self.alertWindow.rootViewController = UIViewController()
        self.alertWindow.windowLevel = UIWindowLevelAlert + 1
        self.alertWindow.makeKeyAndVisible()
        self.alertWindow.rootViewController?.present(noteViewController, animated: animated, completion: nil)
    }
    
    public func start() {
        startHandleDeviceMotion()
    }
    
    public func stop() {
        self.motionManager.stopDeviceMotionUpdates()
    }

}
