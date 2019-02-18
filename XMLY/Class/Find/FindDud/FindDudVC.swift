//
//  FindDudVC.swift
//  XMLY
//
//  Created by isoft on 2019/2/15.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class FindDudVC: UIViewController {

     private var findDudList: [FindDudModel]?
    
    private lazy var tableView:UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight-bottomHeight), style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.init(r: 240, g: 241, b: 244)
        tableview.register(FindDudCell.self, forCellReuseIdentifier: FindDudCell.cellIdentifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUI()
        
        loadData()
        
    }
    
    func setUI() {
        view.addSubview(tableView)
        glt_scrollView = tableView
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
    }
    
    func loadData(){
        //1 获取json文件路径
        let path = Bundle.main.path(forResource: "FindDud", ofType: "json")
        //2 获取json文件里面的内容,NSData格式
        let jsonData=NSData(contentsOfFile: path!)
        //3 解析json内容
        let json = JSON(jsonData!)
        if let mappedObject = JSONDeserializer<FMFindDudModel>.deserializeFrom(json: json.description) {
            self.findDudList = mappedObject.data
            self.tableView.reloadData()
        }
    }
}

extension FindDudVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension FindDudVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.findDudList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FindDudCell.cellIdentifier) as! FindDudCell
        cell.findDudModel = self.findDudList?[indexPath.row]
        return cell
    }
}
