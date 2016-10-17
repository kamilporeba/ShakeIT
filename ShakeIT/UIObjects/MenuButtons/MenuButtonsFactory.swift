//
//  MenuButtonsFactory.swift
//  ShakeIT
//
//  Created by Rafal Prazynski on 28/09/2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import Foundation


enum MenuButtonType : String
{
    case edit
    case mail
    case save
    case menu
}

class MenuButtonsFactory
{
    class func createMenuButton(forSuperview:UIView, type:MenuButtonType, actionBlock: @escaping () -> Void) -> MenuButton
    {
        let menuButton: MenuButton = MenuButton.init(typeButton: type,actionBlock: actionBlock)
        forSuperview.addSubview(menuButton)

        return menuButton
    }
    
    
}
