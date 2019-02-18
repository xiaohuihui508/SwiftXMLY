//
//  FMListenFooterView.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
//

import UIKit

protocol FMListenFooterViewDelegate :NSObjectProtocol {
    func listenFooterAddBtnClick()
}

class FMListenFooterView: UIView {
    
    weak var delegate:FMListenFooterViewDelegate?
    
    var addButton:UIButton = {
       let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(addButtonClick), for: UIControl.Event.touchUpInside)
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    func setUpUI() {
        self.addSubview(addButton)
        addButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(40)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        }
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 20
        
    }
    
    
    @objc func addButtonClick() {
        delegate?.listenFooterAddBtnClick()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
