//
//  WTNavBar.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTNavBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subView in subviews {
            let stringFromClass = NSStringFromClass(subView.classForCoder)
            if stringFromClass.contains("UIBarBackground") {
                subView.frame = CGRect(x: 0, y: -StatusBarHeight, width: UIScreen.cz_screenWidth(), height: 44 + StatusBarHeight)
            }
        }
        
    }
}
