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
    var menuButton: MenuButton!
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        setMenuButton()
        setBlackBackgroundWithOpacity()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        createMenuButtons()
    }

    private func setBlackBackgroundWithOpacity() {
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    private func setMenuButton() {
        createButtonAndAddToSubview()
        setConstraintOnMenuButton()
    }

    private func createButtonAndAddToSubview()
    {
        self.menuButton = MenuButton.init(frame:CGRect(x:0,y:0,width:70,height:70))
        self.menuButton.backgroundColor = UIColor.orange
        self.menuButton.addTarget(self, action: #selector(NoteViewController.showMenuButtons), for: .touchDown)
        self.menuButton.setTitle("MENU", for: .normal)
        self.menuButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(menuButton)
    }
    
    private func setConstraintOnMenuButton()
    {
        let views: [String:UIView] = ["button": menuButton]

        let rightAligment = NSLayoutConstraint.constraints(withVisualFormat: "V:[button(==70)]-20-|", options: [], metrics: nil, views: views)
        let bottomAligment = NSLayoutConstraint.constraints(withVisualFormat: "H:[button(==70)]", options: [], metrics: nil, views: views)
        menuButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        allConstraints += bottomAligment
        allConstraints += rightAligment
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    private func createMenuButtons()
    {
        for _ in 1...3 {
            let buttonMenu = MenuButton(frame:CGRect(x:self.menuButton.frame.minX,y:self.view.frame.height,width:70,height:70))
            buttonMenu.backgroundColor = UIColor.green
            buttonsMenu.append(buttonMenu)
        }
    }
    
    func showMenuButtons()
    {
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
                for (index,button) in self.buttonsMenu.enumerated() {
                    button.frame = CGRect(x:self.menuButton.frame.minX,y:CGFloat(self.menuButton.frame.minY - CGFloat(75) * CGFloat(index + 1)),width:70,height:70)
                    self.view.addSubview(button)
                    self.buttonsMenu.remove(at: index)
                    self.buttonsMenu.insert(button, at: index)
                }
            }) { (success) in
                self.menuButton.removeTarget(self, action: #selector(NoteViewController.showMenuButtons), for: .touchDown)
                self.menuButton.addTarget(self, action: #selector(NoteViewController.hideMenuButtons), for: .touchDown)
                
        }
    }
    
    func hideMenuButtons()
    {
        UIView.animate(withDuration: 0.3, animations: {
            
            for (index,button) in self.buttonsMenu.enumerated() {
                button.frame = CGRect(x:self.menuButton.frame.minX,y:self.view.frame.height,width:70,height:70)
                self.buttonsMenu.remove(at: index)
                self.buttonsMenu.insert(button, at: index)
            }
            
        }) { (success) in
            self.menuButton.removeTarget(self, action: #selector(NoteViewController.hideMenuButtons), for: .touchDown)
            self.menuButton.addTarget(self, action: #selector(NoteViewController.showMenuButtons), for: .touchDown)
        }
        
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
