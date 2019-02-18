//
//  ListenRecommVC.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
// MARK: 听推荐

import UIKit

class ListenRecommVC: UIViewController {
    
    private lazy var tableView:UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight-bottomHeight), style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.init(r: 240, g: 241, b: 244)
        tableview.register(ListenRecommCell.self, forCellReuseIdentifier: ListenRecommCell.cellIdentifier)
        return tableview
    }()
    
    lazy var viewModel: ListenRecommViewModel = {
        return ListenRecommViewModel()
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
    
    func loadData() {
        // 加载数据
        viewModel.updataBlock = { [unowned self] in
            // 更新列表数据
            self.tableView.reloadData()
        }
        viewModel.refreshDataSource()
    }
    
}

extension ListenRecommVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ListenRecommVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListenRecommCell.cellIdentifier) as! ListenRecommCell
        cell.albums = viewModel.albums?[indexPath.row]
        return cell
    }
}
