//
//  ListenChannelCell.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class ListenChannelCell: UITableViewCell {
    
   private let marqueeView = JXMarqueeView()
    
    //Mark:背景大图
    let picView:UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    //Mark:标题
    let titleLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "哈哈哈哈哈哈"
        label.textColor = .white
        return label
    }()
    
    //Mark:滚动文字
    let scrollLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "让蚊子给我滚动起来，让你们看看是怎样的"
        label.textColor = .white
        return label
    }()
    
    //Mark:播放按钮
    let playBtn:UIButton = {
       let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "whitePlay"), for: UIControl.State.normal)
        return btn
    }()
    
    
    static let cellIdentifier = "ListenChannelCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        setUI()
        
    }
    
    func setUI() {
        self.addSubview(picView)
        picView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        self.picView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        // 文字跑马灯效果
        marqueeView.contentView = self.scrollLabel
        marqueeView.contentMargin = 10
        marqueeView.marqueeType = .reverse
        self.picView.addSubview(marqueeView)
        marqueeView.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.left.equalTo(self.titleLabel)
            make.right.equalToSuperview().offset(-70)
        }
        
        self.picView.addSubview(playBtn)
        playBtn.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(45)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
