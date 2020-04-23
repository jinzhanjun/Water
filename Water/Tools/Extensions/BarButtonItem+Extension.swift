//
//  BarButtonItem+Extension.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/23.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    
    /// 自定义导航栏按钮
    /// - Parameters:
    ///   - title: title
    ///   - imageName: 按钮图片名字
    ///   - highlightImageName: 高亮按钮图片名字
    ///   - titleColor: 文字颜色
    ///   - highlightTitleColor: 高亮文字颜色
    convenience init(title: String, fontSize: CGFloat = 14, imageName: String, highlightImageName: String, titleColor: UIColor = UIColor.darkGray, highlightTitleColor: UIColor = UIColor.orange, target: Any?, action: Selector, event: UIControl.Event) {
        
        let button: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: titleColor, highlightedColor: highlightTitleColor)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: highlightImageName), for: .highlighted)
        button.addTarget(target, action: action, for: event)
        
        button.sizeToFit()
        
        self.init(customView: button)
    }
}
