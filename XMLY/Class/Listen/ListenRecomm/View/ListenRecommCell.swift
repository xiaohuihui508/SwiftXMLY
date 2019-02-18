//
//  ListenRecommCell.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class ListenRecommCell: UITableViewCell {
    
    static let cellIdentifier = "ListenRecommCell"
    
    //Mark:背景大图
    let picView:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 3
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    //Mark:标题
    let titleLabel:UILabel = {
       let label = UILabel()
        label.text = "大家好"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    //Mark:副标题
    let subLabel:UILabel = {
       let label = UILabel()
        label.text = "都是一家人"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    //Mark:播放数量
    let numLabel:UILabel = {
        let label = UILabel()
        label.text = "1111"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    //Mark:集数
    let tracksLabel:UILabel = {
        let label = UILabel()
        label.text = "555"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    //Mark:播放数量图片
    let numView:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "playcount.png")
        return imageView
    }()
    
    //Mark:集数图片
    let tracksView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "track.png")
        return imageView
    }()
    
    //Mark:订阅按钮
    let subscibeBtn:UIButton = {
       let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setTitle("+订阅", for: .normal)
        btn.setTitleColor(DominantColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.backgroundColor = UIColor.init(red: 254/255.0, green: 232/255.0, blue: 227/255.0, alpha: 1)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 12
        return btn
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        setUI()
    
    }
    
    func setUI() {
        self.addSubview(self.picView)
        self.picView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(70)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.picView)
            make.left.equalTo(self.picView.snp.right).offset(10)
            make.height.equalTo(20)
            make.right.equalToSuperview()
        }
        
        self.addSubview(self.subLabel)
        self.subLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.left.height.right.equalTo(self.titleLabel)
        }
        
        self.addSubview(self.numView)
        self.numView.snp.makeConstraints { (make) in
            make.left.equalTo(self.subLabel)
            make.bottom.equalTo(self.picView)
            make.width.height.equalTo(17)
        }
        
        self.addSubview(self.numLabel)
        self.numLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.numView.snp.right).offset(5)
            make.bottom.equalTo(self.numView)
            make.width.equalTo(60)
        }
        
        self.addSubview(self.tracksView)
        self.tracksView.snp.makeConstraints { (make) in
            make.left.equalTo(self.numLabel.snp.right).offset(5)
            make.bottom.equalTo(self.numLabel)
            make.width.height.equalTo(20)
        }
        
        self.addSubview(self.tracksLabel)
        self.tracksLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.tracksView.snp.right).offset(5)
            make.bottom.equalTo(self.tracksView)
            make.width.equalTo(80)
        }
        
        
        
        self.addSubview(self.subscibeBtn)
        self.subscibeBtn.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(24)
        }
    }
    
    var albums:albumsModel? {
        didSet {
            guard let model = albums else {return}
//            self.picView.kf.setImage(with: URL(string: model.coverMiddle!))
            self.picView.kf.setImage(with: URL(string: model.coverMiddle ?? ""))
            self.titleLabel.text = model.title
            self.subLabel.text = model.recReason
            self.tracksLabel.text = "\(model.tracks)集"
            
            var tagString:String?
            if model.playsCounts > 100000000 {
                tagString = String(format: "%.1f亿", Double(model.playsCounts) / 100000000)
            } else if model.playsCounts > 10000 {
                tagString = String(format: "%.1f万", Double(model.playsCounts) / 10000)
            } else {
                tagString = "\(model.playsCounts)"
            }
            self.numLabel.text = tagString
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
