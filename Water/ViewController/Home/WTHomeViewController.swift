//
//  WTHomeViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTHomeViewController: WTBasicViewController {
    /// 懒加载视图模型
    lazy var model = WTStatusViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadData() {
        // 加载数据
        model.loadData(isPullUp: isPullUp) { (isSuccess) in
            if isSuccess {
                refresh?.endRefreshing()
                // 表格视图重新加载
                tableView?.reloadData()
            }
            
            // 恢复上拉标记
            isPullUp = true
        }
    }
    
    /// 重写设置导航条
    override func setupNavBar() {
        super.setupNavBar()
        
        // 首页导航按钮
        let button: UIButton = UIButton.cz_textButton("添加好友", fontSize: 14, normalColor: UIColor.systemBlue, highlightedColor: UIColor.orange)
        button.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
        navItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    override func setupTableView() {
        super.setupTableView()
        
        // 注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    }
    
    /// 监听方法
    @objc private func showFriends() {
        navigationController?.pushViewController(WTDemoViewController(), animated: true)
    }
    
    // MARK: - tableViewDelegate
    /// 子类具体实现代理方法
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 获取可重用cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        cell?.textLabel?.text = "\(model.array[indexPath.row])"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 即将显示某一行
        // 判断是否是最后一组的最后一行
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 && row == model.array.count - 1 {
            // 标记为下拉
            isPullUp = false
            // 加载数据
            loadData()
        }
    }
}
