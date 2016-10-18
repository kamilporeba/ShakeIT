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
    
    override init()
    {
        super.init()
        
        mailComposer.mailComposeDelegate = self
    }
    
    func showMailFor(viewController:UIViewController)
    {
        if MFMailComposeViewController.canSendMail() {
            viewController.present(mailComposer, animated: true, completion: nil)
        }
        let alert = UIAlertController(title: "Sorry,", message: "At this moment you can't send email.\n Try later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion:nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        
    }
    
    
}
