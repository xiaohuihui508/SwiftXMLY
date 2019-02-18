//
//  FMFindCell.swift
//  XMLY
//
//  Created by isoft on 2019/2/15.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class FMFindCell: UICollectionViewCell {
    
    static let cellIdentifier = "FMFindCell"
    
    let imageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var dataString:String? {
        didSet {
            self.titleLabel.text = dataString
            self.imageView.image = UIImage(named: dataString!)
        }
    }
    
    
}
