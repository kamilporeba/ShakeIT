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
     override init(frame: CGRect)
     {
        super.init(frame: frame)
        setup()
     }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
    }
    
    private func setup()
    {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
}
