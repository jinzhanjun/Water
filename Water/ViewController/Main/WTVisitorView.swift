//
//  WTVisitorView.swift
//  Water
//
//  Created by jinzhanjun on 2020/4/23.
//  Copyright © 2020 jinzhanjun. All rights reserved.
//

import UIKit

class WTVisitorView: UIView {
    
    var infoDict: [String: String]? {
        didSet {
            // 获取信息字典
            guard let tips = infoDict?["tips"],
                let imageName = infoDict?["houseImageName"]
            else { return }
            
            // 设置tips
            tipLabel.text = tips
            
            // 判断是否是首页
            if imageName == "" {
                return
            }
            
            // 重新设置图标
            houseImageView.image = UIImage(named: "visitordiscover_image_\(imageName)")
            // 移除遮罩图像和旋转图像
            maskIconImageView.isHidden = true
            smalliconImageView.isHidden = true
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
        
        addAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 设置旋转动画
    private func addAnimation() {
        
        /// 设置动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * Double.pi
        animation.duration = 15
        animation.repeatCount = MAXFLOAT
        
        //动画完成不删除，如果 iconView 被释放，动画会一起销毁！
        // 解决切换画面后，换面停止的问题
        animation.isRemovedOnCompletion = false
        // 给 layer 添加动画
        smalliconImageView.layer.add(animation, forKey: nil)
    }
    
    /// 设置界面
    private func setupUI() {
        
        // 设置label的字体属性
        tipLabel.attributedText = NSAttributedString(string: "关注一些人，和一些事，在这里看看发生了什么", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        tipLabel.textColor = UIColor.darkGray
        
        tipLabel.numberOfLines = 0
        tipLabel.textAlignment = .center
        
        // 添加控件
        addSubview(smalliconImageView)
        addSubview(maskIconImageView)
        addSubview(houseImageView)
        addSubview(loginButton)
        addSubview(registButton)
        addSubview(tipLabel)
        
        // 取消自动布局，（系统自动添加的约束）
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        // 旋转视图约束
        addConstraint(NSLayoutConstraint(
            item: smalliconImageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: smalliconImageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1,
            constant: -100)
        )
        
        // 小房子约束
        addConstraint(NSLayoutConstraint(
            item: houseImageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: smalliconImageView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: houseImageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: smalliconImageView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0)
        )
        
        // label约束
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: smalliconImageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: smalliconImageView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 300)
        )
        
        // 登录按钮约束
        addConstraint(NSLayoutConstraint(
            item: loginButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: tipLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 10)
        )
        addConstraint(NSLayoutConstraint(
            item: loginButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: tipLabel,
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
            toItem: loginButton,
            attribute: .top,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: registButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: tipLabel,
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
