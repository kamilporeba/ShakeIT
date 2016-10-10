//
//  NoteViewController.swift
//  ShakeIT
//
//  Created by Kamil Poręba on 25.09.2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController
{
    var allConstraints = [NSLayoutConstraint]()
    var buttonsMenu = [MenuButton]()
    
    lazy var menuButton: MenuButton = {
        let menuBlock = { () -> Void in
            self.showMenuButtons()
        }
        
        let menu = MenuButtonsFactory.createMenuButton(forSuperview: self.view, type: .menu, actionBlock: menuBlock)
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        menu.backgroundColor = UIColor.orange
        menu.setTitle("Menu", for: .normal)
        menu.setTitleColor(UIColor.white, for: .normal)
        return menu
    }()
    
    var mailButton: MenuButton!
    var editButton: MenuButton!
    var saveButton: MenuButton!
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        setBlackBackgroundWithOpacity()
        setConstraintForMenuButton()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        setupMailButton()
        setupEditButton()
        setupSaveButton()
    }
    
    private func setBlackBackgroundWithOpacity()
    {
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    
    func showMenuButtons()
    {
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            
            for (index,button) in self.buttonsMenu.enumerated() {
                let bottomSpace = CGFloat(self.menuButton.frame.minY - CGFloat(80) * CGFloat(index + 1))
                button.frame.origin = CGPoint(x:self.menuButton.frame.minX, y:bottomSpace)
            }
            
        }) { (success) in
           
        }
    }
    
    private func setConstraintForMenuButton()
    {
        let views: [String:UIView] = ["menuButton": menuButton]
        let rightAligment = NSLayoutConstraint.constraints(withVisualFormat: "V:[menuButton(==70)]-20-|", options: [], metrics: nil, views: views)
        let bottomAligment = NSLayoutConstraint.constraints(withVisualFormat: "H:[menuButton(==70)]", options: [], metrics: nil, views: views)
        allConstraints += bottomAligment
        allConstraints += rightAligment
        NSLayoutConstraint.activate(allConstraints)
    }
    
    //MARK: - setup menu buttons
    func setupMailButton()
    {
        let mailBlock = { () -> Void in
            
        }
        
        mailButton = MenuButtonsFactory.createMenuButton(forSuperview: self.view, type: .mail, actionBlock: mailBlock)
        mailButton.frame.origin = CGPoint(x:self.menuButton.frame.minX, y:bottomSpace())
        mailButton.setTitle("Mail", for: .normal)
        self.view.addSubview(mailButton)
        buttonsMenu.append(mailButton)
    }
    
    func setupEditButton()
    {
        let editBlock = { () -> Void in
            
        }
        editButton = MenuButtonsFactory.createMenuButton(forSuperview: self.view, type: .mail, actionBlock: editBlock)
        editButton.frame.origin = CGPoint(x:self.menuButton.frame.minX, y:bottomSpace())
        editButton.setTitle("Edit", for: .normal)
        self.view.addSubview(editButton)
        buttonsMenu.append(editButton)
    }
    
    func setupSaveButton()
    {
        let saveBlock = { () -> Void in
            
        }
        saveButton = MenuButtonsFactory.createMenuButton(forSuperview: self.view, type: .mail, actionBlock: saveBlock)
        saveButton.frame.origin = CGPoint(x:self.menuButton.frame.minX, y:bottomSpace())
        saveButton.setTitle("Save", for: .normal)
        self.view.addSubview(saveButton)
        buttonsMenu.append(saveButton)
    }
    
    func bottomSpace() -> CGFloat
    {
        return CGFloat(self.view.frame.height + CGFloat(70))
    }
    
    private func takeScreenshotOfCurrentView()
    {
        let view = UIApplication.shared.keyWindow
        UIGraphicsBeginImageContextWithOptions(view!.frame.size, true, 0.0)
        view!.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
}
