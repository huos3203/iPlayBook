//
//  BackgroundGradientView.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit

class BackgroundGradientView: UIView {
    class func preferredStartColor() -> UIColor {
       // return UIColor(named: "gradientStart") ?? .white
        return UIColor(displayP3Red: 218.0/255.0, green: 229.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    
    class func preferredEndColor() -> UIColor {
//        return UIColor(named: "gradientEnd") ?? .black
        return UIColor(displayP3Red: 255.0/255.0, green: 216.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    }
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    private var startColor: UIColor = .white
    private var endColor: UIColor = .white
    
    required convenience init(startColor: UIColor, endColor: UIColor) {
        self.init()
        
        self.startColor = startColor
        self.endColor = endColor
        
        let layer = self.layer as! CAGradientLayer
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layer = self.layer as! CAGradientLayer
        layer.colors = [startColor.cgColor, endColor.cgColor]
    }

    class func backgroundWithPreferredColors() -> BackgroundGradientView {
        return BackgroundGradientView(startColor: preferredStartColor(), endColor: preferredEndColor())
    }
}
