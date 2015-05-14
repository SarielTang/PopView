//
//  ViewController.swift
//  PopView
//
//  Created by Sariel's Mac on 15-5-14.
//  Copyright (c) 2015年 Sariel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // 动画转场代理
    let animatorDelegate = PopoverAnimator()
    
    // 用 stroyboard 连线跳转页面，一定会执行的代码
    // 做跳转衔接过程中的准备工作
    @IBAction func btnClick(){
        
        let popVC = PopoverViewController()
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
