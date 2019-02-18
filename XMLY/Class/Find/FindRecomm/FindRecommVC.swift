//
//  FindRecommVC.swift
//  XMLY
//
//  Created by isoft on 2019/2/15.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class FindRecommVC: UIViewController {

    private lazy var tableView:UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight-bottomHeight), style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.init(r: 240, g: 241, b: 244)
        tableview.register(FindRecommendCell.self, forCellReuseIdentifier: FindRecommendCell.cellIdentifier)
        return tableview
    }()
    
    lazy var viewModel: FindRecommendViewModel = {
        return FindRecommendViewModel()
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

extension FindRecommVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FindRecommendCell.cellIdentifier) as! FindRecommendCell
        cell.streamModel = viewModel.streamList?[indexPath.row]
        return cell
    }
    
}
