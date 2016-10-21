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
        if result.rawValue == 0 {
            actualViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
}
