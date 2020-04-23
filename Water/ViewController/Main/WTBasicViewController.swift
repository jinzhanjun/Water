//
//  WTBasicViewController.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/22.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTBasicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// 重写title属性
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    /// 用户是否登录
    var isLogon = false
    
    /// 访客视图字典
    var visitorViewInfo: [String: String]?

    /// 是否为上拉刷新
    var isPullUp = true
    
    /// 懒加载自定义导航条
    lazy var navBar = WTNavBar(frame: CGRect(x: 0, y: StatusBarHeight, width: UIScreen.cz_screenWidth(), height: 44))
    /// 懒加载导航条目
    lazy var navItem = UINavigationItem()
    
    // 定义表格视图
    var tableView: UITableView?
    
    // 定义访客视图
    var visitorView: WTVisitorView?
    
    // 下拉刷新控件
    var refresh: UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置界面
        setupUI()
        // 加载数据
        isLogon ? loadData() : ()
    }
    
    /// 设置界面
    func setupUI() {
        // 设置导航条
        setupNavBar()
        
        // 是否登录？ 登录就显示表格视图，未登录就显示访客视图
        isLogon ? setupTableView() : setupVisitorView()
    }
    
    /// 具体由子类实现
    @objc func loadData() {
        
        // 如果子类不实现任何数据方法，就结束刷新
        refresh?.endRefreshing()
    }
    
    /// 设置表格
    func setupTableView() {
        // 创建
        tableView = UITableView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight())))
        // 设置代理
        tableView!.delegate = self
        tableView!.dataSource = self
        
        // 设置边界
        let edgeInset = UIEdgeInsets(top: navBar.bounds.height, left: 0, bottom: 0, right: 0)
        
        tableView?.contentInset = edgeInset
        tableView?.scrollIndicatorInsets = edgeInset
        
        // 下拉刷新
        refresh = UIRefreshControl()
        refresh?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView?.addSubview(refresh!)
        // 加入视图
        view.insertSubview(tableView!, belowSubview: navBar)
    }
    
    /// 设置访客视图
    private func setupVisitorView() {
        
        visitorView = WTVisitorView(frame: view.bounds)
        
        visitorView?.infoDict = visitorViewInfo
        // 设置背景颜色
        visitorView?.backgroundColor = UIColor.cz_color(withHex: 0xEDEDED)
        
        view.insertSubview(visitorView!, belowSubview: navBar)
    }
    
    /// 设置导航条
    func setupNavBar() {
        navBar.items = [navItem]
        
        // 设置导航条title的文字属性
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        view.addSubview(navBar)
    }
    
    /// 本处仅提出功能，具体实现由子类去实现。
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
