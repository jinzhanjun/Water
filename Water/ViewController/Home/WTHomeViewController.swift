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
    
    override func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "添加好友", style: .plain, target: self, action: #selector(showFriends))
    }
    
    @objc private func showFriends() {
        navigationController?.pushViewController(WTDemoViewController(), animated: true)
    }

}
