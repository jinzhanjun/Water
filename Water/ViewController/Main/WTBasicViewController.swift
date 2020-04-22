//
//  WTBasicViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTBasicViewController: UIViewController {
    
    /// 重写title属性
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    /// 懒加载自定义导航条
    lazy var navBar = WTNavBar(frame: CGRect(x: 0, y: StatusBarHeight, width: UIScreen.cz_screenWidth(), height: 44))
    
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavBar()
        view.backgroundColor = UIColor.cz_random()
    }
    
    /// 设置界面
    func setupUI() {
        
    }
    
    /// 设置导航条
    func setupNavBar() {
        navBar.items = [navItem]
        
        view.addSubview(navBar)
    }
}
