//
//  PopoverPresentationController.swift
//  HMWeibo06
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 heima. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
   
    /// 展现视图的大小
    var presentedFrame: CGRect = CGRectZero
    
    // 遮罩视图
    lazy var dummyView: UIView = {
      
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        
        // 添加手势识别，可以隔离所有底层控件
        let tap = UITapGestureRecognizer(target: self, action: "clickDummyView")
        v.addGestureRecognizer(tap)
        
        return v
    }()
    
    func clickDummyView() {
        // 关闭被 Modal 的视图控制器
        self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
        presentedViewController:    要 modal 显示的视图控制器
        presentingViewController:   文档说，底层的视图控制器，但是实测是nil
    
        containerView                   容器视图，构造函数中，是 nil，符合懒加载的原则
        presentedView()                 被展现的视图
        containerViewWillLayoutSubviews 将要布局子视图，自定义 presentedView 的大小和位置
    */
    override init(presentedViewController: UIViewController!, presentingViewController: UIViewController!) {
        
        println("presented---> \(presentedViewController)")
        println("presenting---> \(presentingViewController)")
        
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
        println("容器视图 \(self.containerView)")
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        // 设置遮罩视图的大小
        dummyView.frame = containerView.bounds
        containerView.insertSubview(dummyView, atIndex: 0)
        
        // 设置目标视图的大小
        presentedView().frame = presentedFrame
    }
}
