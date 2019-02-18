//
//  ListenSubViewModel.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit


class ListenSubViewModel: NSObject {
    
    var albumResults:[AlbumResultsModel]?
    // Mark: -数据源更新
    typealias AddDataBlock = () ->Void
    var updataBlock:AddDataBlock?
}

// Mark:-请求数据
extension ListenSubViewModel {
    func refreshDataSource() {
        //1 获取json文件路径
        let path = Bundle.main.path(forResource: "listenSubscibe", ofType: "json")
        //2 获取json文件里面的内容,NSData格式
        let jsonData=NSData(contentsOfFile: path!)
        //3 解析json内容
        let json = JSON(jsonData!)
        if let mappedObject = JSONDeserializer<AlbumResultsModel>.deserializeModelArrayFrom(json: json["data"]["albumResults"].description) {
            self.albumResults = mappedObject as? [AlbumResultsModel]
            self.updataBlock?()
        }
    }
}

extension ListenSubViewModel {
    // 每个分区显示item数量
    func numberOfRowsInSection(section: NSInteger) -> NSInteger {
        return self.albumResults?.count ?? 0
    }
}
