//
//  WTNavViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTNavViewController: UINavigationController {
    
    lazy var navBar = WTNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 判断是否为根视图
        let childCount = children.count
        // 如果不是，push的时候，隐藏底部tabBar
        if childCount > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
