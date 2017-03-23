//
//  MainNavController.swift
//  LG
//
//  Created by LuzhiChao on 17/3/22.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class MainNavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    // 重写返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            // 返回按钮
            let backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
            backBtn.setImage(UIImage(named: "icon_back_nor"), for: .normal)
            backBtn.addTarget(self, action: #selector(self.back), for: .touchUpInside)
            let barBackBtn = UIBarButtonItem(customView: backBtn)
            // 取消按钮
            let cancleBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
            cancleBtn.setImage(UIImage(named: "icon_login_close_pre"), for: .normal)
            cancleBtn.addTarget(self, action: #selector(self.cancle), for: .touchUpInside)
            let barcancleBtn = UIBarButtonItem(customView: cancleBtn)
            //按钮间的空隙
            let gap = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                      action: nil)
            gap.width = 0;
            //用于消除左边空隙，要不然按钮顶不到最边上
            let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                         action: nil)
            spacer.width = -10;
            viewController.navigationItem.leftBarButtonItems = [spacer, barBackBtn, gap,  barcancleBtn]
           
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func back() {
        QL2("返回")
        self.popViewController(animated: true)
    }
    
    func cancle() {
        self.popToRootViewController(animated: true)
    }
}
