//
//  ListenChannelVC.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
// MARK: 一键听

import UIKit

class ListenChannelVC: UIViewController {

    private lazy var footerView : FMListenFooterView = {
        let view = FMListenFooterView.init(frame: CGRect(x: 0, y: 0, width: YYScreenWidth, height: 100))
        view.addButton.setTitle("➕添加订阅", for: .normal)
        return view
    }()
    
    private lazy var tableView:UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight-bottomHeight), style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.init(r: 240, g: 241, b: 244)
        tableview.register(ListenChannelCell.self, forCellReuseIdentifier: ListenChannelCell.cellIdentifier)
        tableview.tableFooterView = self.footerView
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUI()
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
    
    
    
}

extension ListenChannelVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ListenChannelVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListenChannelCell.cellIdentifier) as! ListenChannelCell
        return cell
    }
}

