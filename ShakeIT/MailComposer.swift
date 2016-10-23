//
//  File.swift
//  ShakeIT
//
//  Created by Rafal Prazynski on 13/10/2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import UIKit
import MessageUI

class MailComposer: NSObject, MFMailComposeViewControllerDelegate
{
    var mailComposer = MFMailComposeViewController()
    var actualViewController:UIViewController?
    
    convenience init(viewController:UIViewController)
    {
        self.init()
        actualViewController = viewController
        mailComposer.mailComposeDelegate = self
    }
    
    func showMail()
    {
        if MFMailComposeViewController.canSendMail() {
            actualViewController!.present(mailComposer, animated: true, completion: nil)
            return
        }
        let alert = UIAlertController(title: "Sorry,", message: "At this moment you can't send email.\n Try later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        actualViewController!.present(alert, animated: true, completion:nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        if result.rawValue == 2 {
            let singleAction = dismissAlertActionFor(actionName:"Ok",style: .default)
            showInformationFor(message: "Message send",firstAction: singleAction,secondAction: nil)
        }
        if result.rawValue == 0 {
            let firstAction = dismissAlertActionFor(actionName:"Ok",style: .destructive)
            
            let secondAction = creatAlertActionFor(name: "Cancel", style: .default, actionBlock: nil)
            showInformationFor(message: "Do you want cancel this message?",firstAction: firstAction,secondAction: secondAction)
        }
    }
    
    func showInformationFor(message: String, firstAction: UIAlertAction, secondAction:UIAlertAction?)
    {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        alert.addAction(firstAction)
        
        if (secondAction != nil) {
            alert.addAction(secondAction!)
        }
        
        mailComposer.present(alert, animated: true, completion: nil)
    }
    
    func creatAlertActionFor(name:String, style:UIAlertActionStyle, actionBlock: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertAction
    {
        let action = UIAlertAction(title: name, style: style, handler: actionBlock)
        return action;
    }
    
    
    func dismissAlertActionFor(actionName:String,style:UIAlertActionStyle) -> UIAlertAction
    {
        let action = creatAlertActionFor(name: actionName, style: style, actionBlock: { (AlertAction) in
            self.actualViewController?.dismiss(animated: true, completion: nil)
        })
        
        return action;
    }
}
