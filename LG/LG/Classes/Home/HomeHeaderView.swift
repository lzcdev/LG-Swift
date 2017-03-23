//
//  HomeHeaderView.swift
//  LG
//
//  Created by LuzhiChao on 17/3/23.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    let imageArray = ["icon_resume_preview_coverImage", "img_home_first_look_unexception_iphone4", "icon_chat_resume_attachment"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.purple
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150), collectionViewLayout: layout)
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        addSubview(collectionView)
        
        
        collectionView.register(UINib.init(nibName: "ImageViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageViewCell
        cell.backImageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        QL2("\(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
