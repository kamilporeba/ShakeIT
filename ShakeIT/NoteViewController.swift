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
    var menuButton: UIButton!
    
    let lineDrawer = LineDrawer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setBlackBackgroundWithOpacity()
        setMenuButton()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        lineDrawer.makeStartPoint(startPoint: (touch?.location(in: self.view))!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        lineDrawer.drawLineForView(view: view, point: (touches.first?.location(in: self.view))!)
    }

    private func setBlackBackgroundWithOpacity()
    {
        self.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    private func setMenuButton() {
        createButtonAndAddToSubview()
        setConstraintOnMenuButton()
    }

    private func createButtonAndAddToSubview()
    {
        self.menuButton = UIButton()
        menuButton.setTitle("MENU", for: .normal)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(menuButton)
    }
    
    private func setConstraintOnMenuButton()
    {
        let views: [String : UIView] = ["button" : menuButton]

        let rightAligment = NSLayoutConstraint.constraints(withVisualFormat: "V:[button]-20-|", options: [], metrics: nil, views: views)
        let bottomAligment = NSLayoutConstraint.constraints(withVisualFormat: "H:[button]-20-|", options: [], metrics: nil, views: views)
        
        allConstraints += bottomAligment
        allConstraints += rightAligment
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    private func takeScreenshotOfCurrentView()
    {
        let view = UIApplication.shared.keyWindow
        UIGraphicsBeginImageContextWithOptions(view!.frame.size, true, 0.0)
        view!.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }

}
