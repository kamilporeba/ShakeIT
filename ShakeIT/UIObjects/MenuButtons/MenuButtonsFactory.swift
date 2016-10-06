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
    case custom
}

class MenuButtonsFactory
{
    class func createMenuButton(type:MenuButtonType, actionBlock: @escaping (MenuButtonType) -> Void) -> MenuButton
    {
        let menuButton : MenuButton = MenuButton.init(typeButton: .edit,actionBlock: actionBlock)

        return menuButton
    }
    
    
}
