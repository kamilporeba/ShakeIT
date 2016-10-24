//
//  LongPressDelegate.swift
//  ShakeIT
//
//  Created by Kamil Poręba on 24.10.2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import Foundation
import UIKit

class LongPressDelegate: NSObject, UIGestureRecognizerDelegate {
    
    weak var superView: UIView?
    let textField = UITextField()
    var tapedPosition: CGPoint?
    
    init(viewContext: UIView) {
        super.init()
        self.superView = viewContext
        textField.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let position =  gestureRecognizer.location(in: self.superView )
        tapedPosition = position
        setTextField(position: position)
        
        return true
    }
    
    private func setTextField(position: CGPoint)  {
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor.white
        textField.text = ""
        textField.frame = CGRect(origin: position, size: CGSize(width: 100, height: 40))
        setProperTextFieldWidth()
        self.superView?.addSubview(textField)
        self.textField.becomeFirstResponder()
    }
    
    private func setProperTextFieldWidth()  {
        setProperTextFieldYPosition()
        var actualWidth =  textField.frame.width
        while (tapedPosition?.x)! + actualWidth > (self.superView?.frame.width)! {
             actualWidth -= 1
        }
       textField.frame = CGRect(origin: tapedPosition!, size: CGSize(width: actualWidth, height: 40))
    }
    
    private func setProperTextFieldYPosition()  {
        var actualPositionY:CGFloat =  (tapedPosition?.y)!
        while actualPositionY + textField.frame.height > (self.superView?.frame.height)! {
            actualPositionY -= 1
        }
        
        textField.frame = CGRect(origin: CGPoint(x: textField.frame.origin.x ,y: actualPositionY), size: CGSize(width: 100, height: 40))
    }

}

extension LongPressDelegate: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeFromSuperview()
        let label = UILabel(frame: textField.frame)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = textField.text
        label.textColor = UIColor.white
        self.superView?.addSubview(label)
    }
}
