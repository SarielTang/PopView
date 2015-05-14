//
//  HomeTableViewController.swift
//  HMWeibo06
//
//  Created by apple on 15/5/10.
//  Copyright (c) 2015年 heima. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    @IBOutlet weak var titleButton: HMTitleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitleButton()
    }
    
    /// 设置标题按钮
    private func setupTitleButton() {
        titleButton.setTitle("我的PopView ", forState: UIControlState.Normal)
    }

    // 动画转场代理
    let animatorDelegate = PopoverAnimator()
    
    // 用 stroyboard 连线跳转页面，一定会执行的代码
    // 做跳转衔接过程中的准备工作
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Home2Popover" {
            let popVC = segue.destinationViewController as PopoverViewController
            
            /**
                要实现自定义Modal转场
                1. 设置转场代理
                    返回 UIPresentationController，由 该控制器，负责 Modal 界面的处理
                2. 指定Modal的展现方式是自定义
            */
            // transition 转场，从一个界面跳到另外一个界面
            popVC.transitioningDelegate = animatorDelegate
            // 设置展现的大小
            let x = (self.view.bounds.width - 200) * 0.5
            animatorDelegate.presentedFrame = CGRectMake(x, 56, 200, 240)
            // 设置展现方式
            popVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }
}

