//
//  MainTabBarController.swift
//  LG
//
//  Created by LuzhiChao on 17/3/22.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setAllChildController()
    }
    
    func setAllChildController() {
        tabBarAddChildController(vc: HomeController(), title: "首页", imageName: "icon_home_nor", seletedImage: "icon_home_pre")
        tabBarAddChildController(vc: HomeController(), title: "消息", imageName: "icon_message_nor", seletedImage: "icon_message_pre")
        tabBarAddChildController(vc: HomeController(), title: "言职", imageName: "icon_find_nor", seletedImage: "icon_find_pre")
        tabBarAddChildController(vc: HomeController(), title: "我", imageName: "icon_setting_nor", seletedImage: "icon_setting_pre")
        
        
    }

    func tabBarAddChildController(vc: UIViewController, title: String, imageName: String, seletedImage: String) {
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: seletedImage)?.withRenderingMode(.alwaysOriginal))
        tabBar.tintColor = UIColor.colorWithHexString(hex: "#1BB48A")
        addChildViewController(MainNavController(rootViewController: vc))
    }

}
