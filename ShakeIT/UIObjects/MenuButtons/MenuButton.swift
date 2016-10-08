//
//  MenuButton.swift
//  ShakeIT
//
//  Created by Rafal Prazynski on 27/09/2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import Foundation

class MenuButton: UIButton
{
    var allConstraints = [NSLayoutConstraint]()
    var type: MenuButtonType!
    var blockAction: (() -> Void)!
    
    var horizonatalFormat = String()
    var verticalFormat = String()
    
    
    init(typeButton: MenuButtonType, actionBlock: @escaping () -> Void)
    {
        blockAction = actionBlock
        type = typeButton
        super.init(frame: CGRect(x:0,y:0,width:0,height:0))
        self.addTarget(self, action: #selector(MenuButton.buttonTapped), for: .touchDown)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addVisualConstraintFormat(vertical:String, horizontal:String)
    {
        verticalFormat = vertical
        horizonatalFormat = horizontal
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width/2
        self.centerXAnchor.constraint(equalTo: (self.superview?.centerXAnchor)!).isActive = true
        setConstraintOnMenuButton()
    }
    
    
    @objc private func buttonTapped ()
    {
        self.transform = CGAffineTransform(scaleX:0.8, y:0.8)
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform(scaleX: 1,y:1)
        }
        blockAction()
    }

    private func setConstraintOnMenuButton()
    {
        let views: [String:UIView] = ["button": self]
        
        let rightAligment = NSLayoutConstraint.constraints(withVisualFormat: verticalFormat, options: [], metrics: nil, views: views)
        let bottomAligment = NSLayoutConstraint.constraints(withVisualFormat: horizonatalFormat, options: [], metrics: nil, views: views)
        allConstraints += bottomAligment
        allConstraints += rightAligment
        NSLayoutConstraint.activate(allConstraints)
    }
    
}
