//
//  FindAttentionPicCell.swift
//  XMLY
//
//  Created by isoft on 2019/2/15.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class FindAttentionPicCell: UICollectionViewCell {
    
    static let cellIdentifier = "FindAttentionPicCell"
    
    let imageView:UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var picModel:FindAPicInfos? {
        didSet {
            guard let model = picModel else {
                return
            }
            self.imageView.kf.setImage(with: URL(string: model.originUrl ?? ""))
        }
    }
    
}
