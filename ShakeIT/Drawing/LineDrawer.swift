//
//  LineDrawer.swift
//  ShakeIT
//
//  Created by Rafal Prazynski on 13/10/2016.
//  Copyright © 2016 Kamil Poręba & Rafał Prążyński. All rights reserved.
//

import UIKit

class LineDrawer
{
    private let bezzierPath = UIBezierPath()
    private let shapeLayer = CAShapeLayer()
    private var startPoint = CGPoint()
    
    init()
    {
        shapeLayer.strokeColor = UIColor.cyan.cgColor
        shapeLayer.lineWidth = 2.0
    }
    
    func makeStartPoint(startPoint: CGPoint)
    {
        self.startPoint = startPoint
    }
    
    func drawLineForView(view:UIView, point: CGPoint)
    {
        bezzierPath.move(to: CGPoint(x:startPoint.x, y:startPoint.y))
        bezzierPath.addLine(to: CGPoint(x:point.x, y:point.y))
        
        self.startPoint = point
        
        UIView.animate(withDuration: 0.0) {
            self.bezzierPath.close()
            self.bezzierPath.stroke()
            self.bezzierPath.fill()
            self.shapeLayer.path = self.bezzierPath.cgPath
            view.layer.addSublayer(self.shapeLayer)
        }
    }
    
}

