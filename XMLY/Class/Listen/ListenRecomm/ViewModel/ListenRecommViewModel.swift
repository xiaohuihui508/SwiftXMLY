//
//  ListenRecommViewModel.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class ListenRecommViewModel: NSObject {
    var albums:[albumsModel]?
    // Mark: -数据源更新
    typealias AddDataBlock = () ->Void
    var updataBlock:AddDataBlock?
}

// Mark:-请求数据
extension ListenRecommViewModel {
    func refreshDataSource() {
        //1 获取json文件路径
        let path = Bundle.main.path(forResource: "listenRecommend", ofType: "json")
        //2 获取json文件里面的内容,NSData格式
        let jsonData=NSData(contentsOfFile: path!)
        //3 解析json内容
        let json = JSON(jsonData!)
        if let mappedObject = JSONDeserializer<albumsModel>.deserializeModelArrayFrom(json: json["data"]["albums"].description) {
            self.albums = mappedObject as? [albumsModel]
            self.updataBlock?()
        }
    }
}

extension ListenRecommViewModel {
    // 每个分区显示item数量
    func numberOfRowsInSection(section: NSInteger) -> NSInteger {
        return self.albums?.count ?? 0
    }
}
