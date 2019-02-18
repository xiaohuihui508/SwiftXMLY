//
//  ViewController.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark:--headerview
    private lazy var headerView:FMListenHeaderView = {
       let view = FMListenHeaderView.init(frame: CGRect(x: 0, y: 0, width: YYScreenWidth, height: 120))
//        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var viewControllers:[UIViewController] = {
       let vc1 = ListenSubVC()
       let vc2 = ListenChannelVC()
       let vc3 = ListenRecommVC()
        return [vc1, vc2, vc3]
    }()
    
    private lazy var titles:[String] = {
       return ["订阅", "一键听", "推荐"]
    }()
    
    private lazy var layout:LTLayout = {
       let layout = LTLayout()
       layout.isAverage = true
       layout.sliderWidth = 80
       layout.titleViewBgColor = UIColor.white
       layout.titleColor = UIColor(r: 178, g: 178, b: 178)
       layout.titleSelectColor = UIColor(r: 16, g: 16, b: 16)
       layout.bottomLineColor = .red
       layout.sliderHeight = 56
       return layout
    }()
    
    private lazy var advancedManager:LTAdvancedManager = {
       let statusbarH = UIApplication.shared.statusBarFrame.size.height
        let advancedManager = LTAdvancedManager(frame: CGRect(x: 0, y: navigationBarHeight, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout, headerViewHandle: {[weak self] in
            guard let strongSelf = self else { return UIView() }
            let headerView = strongSelf.headerView
            return headerView
        })
        /* 设置代理 监听滚动 */
        advancedManager.delegate = self
        
        return advancedManager
    }()
    
    //Mark:--导航栏左边按钮
    private lazy var leftBarButton:UIButton = {
       let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setTitle("消息", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(leftBarButtonClick), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    //Mark:--导航栏右边按钮
    private lazy var rightBarButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setTitle("搜索", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(rightBarButtonClick), for: UIControl.Event.touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "我听"
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(advancedManager)
        advancedManagerConfig()
        
        //导航栏
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBarButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBarButton)
        
    }
    
    //Mark: - 导航栏左边消息点击事件
    @objc func leftBarButtonClick() {
        print("点击消息按钮")
    }
    
    //Mark: - 导航栏左边消息点击事件
    @objc func rightBarButtonClick() {
         print("点击搜索按钮")
    }


}

extension ViewController : LTAdvancedScrollViewDelegate {
    //MARK:具体使用请参考以下
    private func advancedManagerConfig() {
        advancedManager.advancedDidSelectIndexHandle = {
            print("选中了 -> \($0)")
        }
    }
}

