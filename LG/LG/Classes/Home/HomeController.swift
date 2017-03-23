//
//  HomeController.swift
//  LG
//
//  Created by LuzhiChao on 17/3/22.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import SnapKit
class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    private lazy var customNavigationBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 64)
        
        setupTableView()
        
        setTableHeaderView()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //界面将显示隐藏系统导航栏，添加自定义导航栏，防止从后面界面pop回此界面时导航栏显示有问题
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.view.insertSubview(customNavigationBar, at: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        customNavigationBar.removeFromSuperview()
        //界面将要消失时，显示系统导航栏，移除自定义的导航栏
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: -20, width: ScreenWidth, height: ScreenHeight - TabHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self;
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func setTableHeaderView() {
        let view = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
        tableView.tableHeaderView = view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(PositionDetailController(), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let alpha = 1 - ((64 - offsetY) / 64);
        if offsetY < 0 {
            UIView.animate(withDuration: 0.1, animations: {
                self.customNavigationBar.backgroundColor = UIColor.colorWithHexString(hex: "#1BB48A").withAlphaComponent(0)
            })
            
        }else{
            UIView.animate(withDuration: 0.1, animations: {
                self.customNavigationBar.backgroundColor = UIColor.colorWithHexString(hex: "#1BB48A").withAlphaComponent(alpha)
            })
        }
    }
    
    
}
