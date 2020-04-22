//
//  WTMainViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit
//import Foundation

class WTMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置界面
        setupUI()
        view.backgroundColor = UIColor.white
    }
    
    /// 设置界面
    private func setupUI() {
        
        // 遍历字典
        for dict in classInfoDic {
            guard let child = creatClass(by: dict) else { return }
            
            // 设置字体颜色
            child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected) // 选择状态
            child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal) // 正常状态
            // 设置字体大小
            child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal) // 字体大小
            addChild(child)
        }
    }
    
    /// 类字典信息
    var classInfoDic: [[String: String]] {
        return [["clsName": "WTHomeViewController", "title": "首页", "imageName": "home"],
                ["clsName": "WTMessageViewController", "title": "消息", "imageName": "message_center"],
                ["clsName": "WTDiscoverViewController", "title": "发现", "imageName": "discover"],
                ["clsName": "WTProfileViewController", "title": "我", "imageName": "profile"],
        ]
    }
    /// 根据字典创建类
    private func creatClass(by dict: [String: String]) -> UIViewController? {
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(clsName.addNameSpace) as? UIViewController.Type
            else { return nil }
        
        let vc = cls.init()
        // 设置标题
        vc.title = title
        // 设置标题图片
        vc.tabBarItem.image = UIImage(named: "tabbar_\(imageName)") // 正常状态
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_\(imageName)_selected")?.withRenderingMode(.alwaysOriginal) // 选择状态
        
        // 使用navgation包装 --- 多态
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }
}
