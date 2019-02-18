//
//  Const.swift
//  XMLY
//
//  Created by isoft on 2019/2/13.
//  Copyright © 2019 isoft. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher


let YYScreenWidth = UIScreen.main.bounds.size.width
let YYScreenHeigth = UIScreen.main.bounds.size.height
let DominantColor = UIColor.init(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let FooterViewColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)

// iphone X
let isIphoneX = (YYScreenHeigth == 812 || YYScreenHeigth == 896) ? true : false
// navigationBarHeight
let navigationBarHeight : CGFloat = isIphoneX ? 88 : 64
// BottomHeight
let bottomHeight : CGFloat = isIphoneX ? 34 : 0
// tabBarHeight
let tabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49


