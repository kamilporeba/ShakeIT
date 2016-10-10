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
    private var type: MenuButtonType!
    var blockAction: (() -> Void)!
    
    
    var bottomSpace = NSLayoutConstraint()
    
    
    init(typeButton: MenuButtonType, actionBlock: @escaping () -> Void)
    {
        blockAction = actionBlock
        type = typeButton
        super.init(frame: CGRect(x:0,y:0,width:70,height:70))
        
        self.backgroundColor = UIColor.white
        self.addTarget(self, action: #selector(MenuButton.buttonTapped), for: .touchDown)
        self.setTitleColor(UIColor.black, for: .normal)
        setTitleForType(type: typeButton)
    }
    
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width/2
    }
    
    
    @objc private func buttonTapped ()
    {
        self.transform = CGAffineTransform(scaleX:0.8, y:0.8)
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform(scaleX: 1,y:1)
        }
        blockAction()
    }
    
    func setTitleForType(type: MenuButtonType)
    {
        var title : String
        
        switch type {
        case .edit:
            title = "Edit"
            
        case .mail:
            title = "Mail"
            
        case .menu:
            title = "Menu"
            
        case .save:
            title = "Save"
            
        default:
            title = ""
        }
        
        self.setTitle(title, for: .normal)
    }

    
}
