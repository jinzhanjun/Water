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
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一页", style: .plain, target: self, action: #selector(showNext))
    }
    
    @objc private func showNext() {
        navigationController?.pushViewController(WTDemoViewController(), animated: true)
    }
}
