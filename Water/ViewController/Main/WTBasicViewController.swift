//
//  WTBasicViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTBasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        view.backgroundColor = UIColor.cz_random()
    }
    
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一页", style: .plain, target: self, action: #selector(pushNext))
    }
    
    /// push 下一页
    @objc private func pushNext() {
        navigationController?.pushViewController(WTDemoViewController(), animated: true)
    }
}
