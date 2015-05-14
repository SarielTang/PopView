//
//  PopoverAnimator.swift
//  HMWeibo06
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 heima. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
   
    // 是否正在展现的标记
    var isPresentation = false
    // 展现视图的Frame
    var presentedFrame = CGRectZero
    
    /// 返回控制 Modal 管理的控制器
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        let popover = PopoverPresentationController(presentedViewController: presented, presentingViewController: presenting)
        
        popover.presentedFrame = presentedFrame
        
        return popover
    }
    
    /// 返回提供 Modal 展现动画对象
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Modal
        isPresentation = true
        
        return self
    }
    
    /// 返回提供 Dismiss 动画的对象
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Dismiss
        isPresentation = false
        
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    /**
    transitionContext   转场上下文，提供转场动画的相关信息
    从哪里来，到哪里去
    
    主动提供转场的动画，一旦实现了这个方法，原有的转场动画会失效->目标控制器看不到了
    */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // 将 toVC 的 view 添加到容器视图
        if isPresentation {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
            
            // 将目标视图添加到容器视图
            transitionContext.containerView().addSubview(toView)
            
            // 动画方法
            // 设置动画初始的形变
            toView.transform = CGAffineTransformMakeScale(1.0, 0)
            // 设置图层的锚点
            toView.layer.anchorPoint = CGPointMake(0.5, 0)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5.0, options: nil, animations: { () -> Void in
                
                toView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                
                }, completion: { (_) -> Void in
                    transitionContext.completeTransition(true)
            })
        } else {
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
            
            // 将 Modal 出来的视图 从容器视图中删除
            fromView.removeFromSuperview()
            
            // 动画完成
            // *** 一定必须要执行的函数，告诉系统转场动画结束了
            transitionContext.completeTransition(true)
        }
    }
}
