//
//  WTNavViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置界面
        setupUI()
    }
    
    /// 设置界面
    private func setupUI() {
        navigationBar.isHidden = true
    }
    
    /// 重写push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        var title = "返回"
        
        // 判断是否为根视图
        let childCount = children.count
        // 如果不是，push的时候，隐藏底部tabBar
        if childCount == 1 {
            viewController.hidesBottomBarWhenPushed = true
            
            title = children[0].title ?? ""
        }
        
        if let vc = viewController as? WTDemoViewController {
            
            vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, imageName: "navigationbar_back_withtext", highlightImageName: "navigationbar_back_withtext_highlighted", target: self, action: #selector(back), event: .touchUpInside)
            
            vc.title = "第 \(childCount) 页"
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    @objc private func back() {
        popViewController(animated: true)
    }
}
