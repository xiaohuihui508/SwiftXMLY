//
//  FindDudCell.swift
//  XMLY
//
//  Created by isoft on 2019/2/15.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class FindDudCell: UITableViewCell {
    
    static let cellIdentifier = "FindDudCell"

    let picView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        return imageView
    }()
    
    let iconView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "news.png")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    //标题
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        return label
    }()
    
    
    //昵称
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.gray
        return label
    }()
    
    // 赞
    let zanLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        return label
    }()
    let zanImageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    // 评论
    let commnetLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let commentImageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
        
    }
    
    
    func setUpUI(){
        self.addSubview(self.picView)
        self.picView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        self.picView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
        
        self.addSubview(self.iconView)
        self.iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.height.equalTo(30)
        }
        
        self.addSubview(self.nameLabel)
        self.nameLabel.text = "喜马拉雅好声音"
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconView.snp.right).offset(8)
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerY.equalTo(self.iconView)
        }
        
        self.addSubview(self.commnetLabel)
        self.commnetLabel.text = "8494"
        self.commnetLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(20)
            make.width.equalTo(30)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        self.addSubview(self.commentImageView)
        self.commentImageView.image = UIImage(named: "评论")
        self.commentImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.commnetLabel.snp.left).offset(-5)
            make.centerY.equalTo(self.commnetLabel)
            make.width.height.equalTo(25)
        }
        
        self.addSubview(self.zanLabel)
        self.zanLabel.text = "20.4万"
        self.zanLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.commentImageView.snp.left).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.centerY.equalTo(self.commentImageView)
        }
        
        self.addSubview(self.zanImageView)
        self.zanImageView.image = UIImage(named: "点赞")
        self.zanImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.zanLabel.snp.left).offset(-5)
            make.width.height.equalTo(20)
            make.centerY.equalTo(self.zanLabel)
        }
    }
    var findDudModel: FindDudModel? {
        didSet {
            guard let model = findDudModel else {return}
            self.picView.kf.setImage(with: URL(string: (model.dubbingItem?.coverPath)!))
            self.titleLabel.text = model.dubbingItem?.intro
            self.iconView.kf.setImage(with: URL(string: (model.dubbingItem?.logoPic)!))
            self.nameLabel.text = model.dubbingItem?.nickname
            let zanNum:Int = (model.dubbingItem?.favorites)!
            self.zanLabel.text = "\(zanNum)"
            let commentNum:Int = (model.dubbingItem?.commentCount)!
            self.commnetLabel.text = "\(commentNum)"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}