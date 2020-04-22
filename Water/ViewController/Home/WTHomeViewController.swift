//
//  WTHomeViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTHomeViewController: WTBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// 重写设置导航条
    override func setupNavBar() {
        super.setupNavBar()
        
        // 首页导航汗牛
        let button: UIButton = UIButton.cz_textButton("添加好友", fontSize: 16, normalColor: UIColor.systemBlue, highlightedColor: UIColor.orange)
        button.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
        navItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    /// 监听方法
    @objc private func showFriends() {
        navigationController?.pushViewController(WTDemoViewController(), animated: true)
    }
}
