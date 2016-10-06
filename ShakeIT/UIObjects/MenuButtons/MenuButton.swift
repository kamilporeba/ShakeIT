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
    var type: MenuButtonType!
    var blockAction: ((MenuButtonType) -> Void)!
    
    init(typeButton: MenuButtonType, actionBlock: @escaping (MenuButtonType) -> Void)
    {
        super.init(frame: CGRect(x:0,y:0,width:0,height:0))
        blockAction = actionBlock
        type = typeButton
        self.addTarget(self, action: #selector(MenuButton.buttonTapped), for: .touchDown)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    @objc private func buttonTapped ()
    {
        blockAction(type)
    }
    
    private func setup()
    {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
}
