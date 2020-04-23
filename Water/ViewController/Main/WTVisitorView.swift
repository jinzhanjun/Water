//
//  WTVisitorView.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/23.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTVisitorView: UIView {
    
    var tipText: String? {
        didSet {
            tipLabel.text = tipText
        }
    }
    
    // 登录按钮
    private lazy var loginButton: UIButton = UIButton.cz_textButton(
        "登录",
        fontSize: 16,
        normalColor: UIColor.darkGray,
        highlightedColor: UIColor.orange,
        backgroundImageName: "common_button_white_disable"
    )
    // 注册按钮
    private lazy var registButton: UIButton = UIButton.cz_textButton(
        "注册",
        fontSize: 16,
        normalColor: UIColor.darkGray,
        highlightedColor: UIColor.orange,
        backgroundImageName: "common_button_white_disable"
    )
    
    /// 小房子
    private lazy var houseImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    /// 旋转图标
    private lazy var smalliconImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    /// 遮罩（仅首页有）
    private lazy var maskIconImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    /// 标语
    private lazy var tipLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 设置界面
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 设置界面
    private func setupUI() {
        
        tipText = "关注一些人，关注一些事！！！"
        tipLabel.attributedText = NSAttributedString(string: tipText!, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        tipLabel.textColor = UIColor.darkGray
        // 添加控件
        addSubview(smalliconImageView)
        addSubview(maskIconImageView)
        addSubview(houseImageView)
        addSubview(loginButton)
        addSubview(registButton)
        addSubview(tipLabel)
        
        // 取消自动布局，（系统自动添加的约束）
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        // 小房子约束
        addConstraint(NSLayoutConstraint(
            item: houseImageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: houseImageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1,
            constant: -100)
        )
        
        // 旋转视图约束
        addConstraint(NSLayoutConstraint(
            item: smalliconImageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: smalliconImageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0)
        )
        
        // 旋转视图约束
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 50)
        )
        
        // 登录按钮约束
        addConstraint(NSLayoutConstraint(
            item: loginButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 80)
        )
        addConstraint(NSLayoutConstraint(
            item: loginButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .centerX,
            multiplier: 1,
            constant: 60))
        addConstraint(NSLayoutConstraint(
            item: loginButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 100))
        
        // 注册按钮约束
        addConstraint(NSLayoutConstraint(
            item: registButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 80)
        )
        addConstraint(NSLayoutConstraint(
            item: registButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: houseImageView,
            attribute: .centerX,
            multiplier: 1,
            constant: -60))
        addConstraint(NSLayoutConstraint(
            item: registButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: loginButton,
            attribute: .width,
            multiplier: 1,
            constant: 0))
        
        
        /// 遮罩图像
        /// VFL 创建约束
        let metrics = ["space": -40]
        let views = ["maskIconImageView": maskIconImageView, "registButton": registButton]
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[maskIconImageView]-0-|",
            options: [],
            metrics: nil,
            views: views)
        )
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[maskIconImageView]-(space)-[registButton]",
            options: [],
            metrics: metrics,
            views: views)
        )
    }
}
