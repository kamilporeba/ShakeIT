//
//  ShakeIT.swift
//  ShakeIT
//
//  Created by Kamil Poręba on 24.09.2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import Foundation
import UIKit


public class ShakeIT {
    
    let emailAddress: String!
    private let alertWindow = UIWindow(frame: UIScreen.main.bounds)
    private var shouldShow = true
    
    public init(emailAddress: String) {
        self.emailAddress = emailAddress
    }
    
    private func  startHandleDeviceMotion()  {
        MotionHandler.shared.setDeviceMotionUpdateActionAndInterval { 
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
        MotionHandler.shared.stopHandleMotion()
    }

}
