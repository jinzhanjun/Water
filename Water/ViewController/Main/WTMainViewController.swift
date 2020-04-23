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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 添加撰写按钮
        addComposeBtn()
    }
    
    /// 设置界面
    private func setupUI() {
        // 遍历字典
        for dict in classInfoDic {
            addChild(creatClass(by: dict))
        }
    }
    
    /// 创建撰写微博按钮
    private func addComposeBtn() {
        
        
        let btn: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
        // 设置高亮图片
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        
        // 计算单个Item的宽度
        let width = tabBar.bounds.width / CGFloat(children.count)
        // 设置frame
        btn.frame = tabBar.bounds.insetBy(dx: 2 * width, dy: 0)
        // 监听方法
        btn.addTarget(self, action: #selector(compose), for: .touchUpInside)
        // 加入视图
        tabBar.addSubview(btn)
    }
    
    /// 撰写微博
    @objc private func compose() {
        print("撰写微博")
    }
    
    /// 类字典信息
    var classInfoDic: [[String: Any]] {
        return [["clsName": "WTHomeViewController", "title": "首页", "imageName": "home", "visitorViewInfo": ["tips": "关注一些人，看到一些事，在这里分享！关注一些人，看到一些事，在这里分享！", "houseImageName": ""]],
                ["clsName": "WTMessageViewController", "title": "消息", "imageName": "message_center", "visitorViewInfo": ["tips": "关注一些人，看到一些事，在这里分享！", "houseImageName": "message"]],
                ["clsName": "composeViewController"],
                ["clsName": "WTDiscoverViewController", "title": "发现", "imageName": "discover", "visitorViewInfo": ["tips": "沟通消息，在这里开始", "houseImageName": "message"]],
                ["clsName": "WTProfileViewController", "title": "我", "imageName": "profile", "visitorViewInfo": ["tips": "发现我自己！", "houseImageName": "profile"]],
        ]
    }
    /// 根据字典创建类
    private func creatClass(by dict: [String: Any]) -> UIViewController {
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let visitorViewInfo = dict["visitorViewInfo"] as? [String: String],
            let cls = NSClassFromString(clsName.addNameSpace) as? WTBasicViewController.Type
            else { return UIViewController() }
        
        let vc = cls.init()
        // 设置标题
        vc.title = title
        // 设置访客视图字典
        vc.visitorViewInfo = visitorViewInfo
        // 设置标题图片
        vc.tabBarItem.image = UIImage(named: "tabbar_\(imageName)") // 正常状态
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_\(imageName)_selected")?.withRenderingMode(.alwaysOriginal) // 选择状态
        
        // 设置字体颜色
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected) // 选择状态
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal) // 正常状态
        // 设置字体大小
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal) // 字体大小
        
        // 使用navgation包装 --- 多态
        let nav = WTNavViewController(rootViewController: vc)
        return nav
    }
}
