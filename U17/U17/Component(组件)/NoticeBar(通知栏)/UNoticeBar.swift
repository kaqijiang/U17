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
                backgroundColor = UIColor.orange,
                barStyle = UNoticeBarStyle.onNavigationBar
                animationType = UNOticeBarAnimationType.top) {
        
        self.title = title
        self.image = image
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.barStyle = barStyle
        self.animationType = animationType
    }
}

//开放类
open class UNoticeBar: UIView {
    
    //UNoticeBarConfig 结构体 写了两个构造方法。应该是就不会走系统默认的构造方法了。但是。这两个构造方法是如何走的呢？ 走1还是走2 ，走1的话 调用的是哪。走2的话 1为什么要写。
    private var config = UNoticeBarConfig()
    
}












