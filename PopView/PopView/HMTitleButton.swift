//
//  HMTitleButton.swift
//  HMWeibo06
//
//  Created by apple on 15/5/13.
//  Copyright (c) 2015年 heima. All rights reserved.
//

import UIKit

class HMTitleButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.titleLabel?.text == "首页" {
            return
        }
        
        titleLabel!.frame = CGRectOffset(titleLabel!.frame, -self.imageView!.frame.size.width, 0)
        imageView!.frame = CGRectOffset(imageView!.frame, titleLabel!.frame.size.width, 0)
    }
}
