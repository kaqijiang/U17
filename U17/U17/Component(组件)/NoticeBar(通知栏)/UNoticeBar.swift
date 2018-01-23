//
//  UNoticeBar.swift
//  U17
//
//  Created by kaqi on 2018/1/22.
//  Copyright © 2018年 myself. All rights reserved.
//

import UIKit

//枚举
public enum UNoticeBarStyle {
    case onStatusBar//状态栏
    case onNavigationBar//导航栏
}

public enum UNoticeBarAnimationType {
    case top
    case bottom
    case left
    case right
}

//结构体
public struct UNoticeBarConfig {
    public init() {}//1
    
    public var title: String?
    public var image: UIImage? = nil
    public var margin: CGFloat = 10.0
    public var textColor: UIColor = UIColor.black
    public var backgroundColor = UIColor.white//自动推导
    public var animationType = UNoticeBarAnimationType.top
    public var barStyle = UNoticeBarStyle.onNavigationBar
    
    //指定构造方法 2
    public init(title: Sting? = nil,
                image: UIImage? = nil,
                textColor: UIColor = UIColor.white,
                backgroundColor: UIColor = .orange,
                barStyle: UNoticeBarStyle = onNavigationBar,
                animationType: UNOticeBarAnimationType = .top) {
        
        self.title = title
        self.image = image
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.barStyle = barStyle
        self.animationType = animationType
    }
}


/*
    fileprivate是新的Swift 3访问修饰符之一，它取代private了它的含义。
    fileprivate定义了一个实体（类，扩展，属性，...）作为声明源文件之外的所有人的私有，但可以被该源文件中的所有实体访问。
    private 限制直接封闭范围内的实体。
 */
fileprivate struct UNoticeBarProperties {
    init() {}
    var shadowOffsetY: CGFloat = 0
    var fontSizeScaleFactor: CGFloat = 0
    var textFont = UIFont()
    var viewFrame = CGRect.zero
    
    init(shadowOffsetY: CGFloat, fontSizeScaleFactor: CGFloat, textFont: UIFont, viewFrame: CGRect) {
        self.shadowOffsetY = shadowOffsetY
        self.fontSizeScaleFactor = fontSizeScaleFactor
        self.textFont = textFont
        self.viewFrame = viewFrame
    }
}

public struct UNoticeBarConfig {
    public init(){}
    
    public var title: String?//存储属性没有值或者为nil的话用可选项
    public var image: UIImage? = nil
    public var margin: CGFloat = 10.0
    public var textColor: UIColor = UIColor.black
    public var backgroundColor = UIColor.white
    public var animationTyep = UNoticeBarAnimationType.top
    public var barStyle = UNoticeBarStyle.onNavigationBar
    
    public init(title: String? = nil,
                image: UIImage? = nil,
                textColor: UIColor = UIColor.white,
                backgroundColor: UIColor = UIColor.orange,
                barStyle: UNoticeBarStyle = .onNavigationBar,
                animatoinType: UNoticeBarAnimationType = .top) {
        self.title = title
        self.image = image
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.barStyle = barStyle
        self.animationTyep = animationTyep
    }
}

//开放类
open class UNoticeBar: UIView {
    
    //UNoticeBarConfig 结构体 写了两个构造方法。应该是就不会走系统默认的构造方法了。但是。这两个构造方法是如何走的呢？ 走1还是走2 ，走1的话 调用的是哪。走2的话 1为什么要写。
    private var config = UNoticeBarConfig()
    
    open var titleLabel: UILabel? {
        return _titleLabel
    }
    open var imageView: UIImageView? {
        return _imageView
    }
    
    private var _titleLabel: UILabel?
    private var _imageView: UIImageView?
    
    public func show(duration: TimeInterval, completed:((_ finished: Bool) -> Void)? = nil) {
        
        self.show(duration: duration, willShow: {
            [weak self] in
            guard let strongSelf = self else {return}
            completed?(finished)
            if finished {
                let currentWindowLevel = strongSelf.config.barStyle.endWindowLevel
                UIApplication.shared.keyWindow?.windowLevel = currentWindowLevel
            }
        })
    }
    
    public init(config: UNoticeBarConfig) {
        super.init(frame: config.barStyle.noticeBarProperties().viewFrame)
        self.backgroundColor = config.backgroundColor
        self.config = config
        self.layer.shadowOffset = CGSize(width: 0, height: config.barStyle.noticeBarProperties().shadowOffsetY)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowColor = 5
        self.layer.shadowOpacity = 0.44
        configSubViews()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSubviews() {
        _titleLabel = UILabel()
        _titleLabel?.text = config.title
        _titleLabel?.textColor = config.textColor
        titleLabel?.minimumScaleFactor = config.barStyle.noticeBarProperties().textFont
        addSubview(_titleLabel)
        
        var titleLabelOriginX: CGFloat = 0
        var titleLabelOriginY: CGFloat = 0
        var titleLabelHeigth: CGFloat = 0
        var titleLabelWidth: CGFloat = 0
        
        if let image = config.image, config.barStyle != .onStatusBar {
            
            _imageView = UIImageView(image: image)
            _imageView?.contentMode = .scaleAspectFill
            addSubview(_imageView)
            
            let imageViewWidth: CGFloat = 25
            let imageViewOriginX = config.margin + 10
            let iamgeViewOrginY = config.barStyle.noticeBarOriginY()
        }
        
        
    }
}

extension UNoticeBarStyle {
    
    fileprivate func noticeBarProperties() -> UNoticebarProperties
}










