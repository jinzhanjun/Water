//
//  WTNavButton.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/23.
////  Copyright © 2020 jinzhanjun. All rights reserved.
////
//
//import UIKit
//
//class WTNavButton: UIButton {
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    
//    
//    required init(title: String?, fontSize: CGFloat = 14, titleNormalColor: UIColor = UIColor.darkGray, titleHightLightedColor: UIColor = UIColor.orange) {
//        
//        super.init(frame: CGRect())
//        
//        let button = UIButton()
//        // 返回箭头
//        button.setImage(UIImage(named: "navigationbar_back_withtext"), for: .normal)
//        button.setImage(UIImage(named: "navigationbar_back_withtext_highlighted"), for: .highlighted)
//        
//        // 设置标题
//        button.setTitle(title, for: .normal)
//        button.titleLabel?.font = UIFont().withSize(fontSize)
//        button.setTitleColor(titleNormalColor, for: .normal)
//        button.setTitleColor(titleHightLightedColor, for: .highlighted)
//        
//        button.sizeToFit()
//        
//
//        
////
////        let backButton: UIButton = UIButton()
////        backButton.setImage(UIImage(named: "navigationbar_back_withtext"), for: .normal)
////        backButton.setImage(UIImage(named: "navigationbar_back_withtext_highlighted"), for: .highlighted)
////        backButton.setTitle(" 返回", for: .normal)
////        backButton.titleLabel?.font = UIFont().withSize(14)
////        backButton.setTitleColor(UIColor.darkGray, for: .normal)
////        backButton.setTitleColor(UIColor.orange, for: .highlighted)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
