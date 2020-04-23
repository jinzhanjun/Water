//
//  WTDemoViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTDemoViewController: WTBasicViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    }
    
    
    override func setupNavBar() {
        super.setupNavBar()
        
        // 下一页按钮
        let button: UIButton = UIButton.cz_textButton("下一页", fontSize: 14, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        button.addTarget(self, action: #selector(showNext), for: .touchUpInside)
        
        // 添加按钮
        navItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    /// 下一页
    @objc private func showNext() {
        navigationController?.pushViewController(WTDemoViewController(), animated: true)
    }
}
