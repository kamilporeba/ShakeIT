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
    var buttonsMenu = [UIButton]()
    var menuButtonsContainer = MenuButtonsContainer()
    
    lazy var menuButton: MenuButton = {
        let menuBlock = { () -> Void in
            
        }
        
        let menu = MenuButtonsFactory.createMenuButton(type: .menu, actionBlock: menuBlock)
        menu.backgroundColor = UIColor.orange
        menu.setTitle("MENU", for: .normal)
        return menu
    }()
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        setMenuButton()
        setBlackBackgroundWithOpacity()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
    }

    private func setBlackBackgroundWithOpacity() {
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    private func setMenuButton() {
        addMenuButtonToSubview()
    }

    private func addMenuButtonToSubview()
    {
        self.view.addSubview(self.menuButton)
    }
    
    func showMenuButtons()
    {
        
    }
    
    func hideMenuButtons()
    {
        
    }
    
    
    private func takeScreenshotOfCurrentView() {
        let view = UIApplication.shared.keyWindow
        UIGraphicsBeginImageContextWithOptions(view!.frame.size, true, 0.0)
        view!.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
    private func show()
    {
        
    }
    
}
