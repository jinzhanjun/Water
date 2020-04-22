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
        let button: UIButton = UIButton.cz_textButton("下一页", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        button.addTarget(self, action: #selector(showNext), for: .touchUpInside)
        
        navItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    @objc private func showNext() {
        navigationController?.pushViewController(WTDemoViewController(), animated: true)
    }
}
