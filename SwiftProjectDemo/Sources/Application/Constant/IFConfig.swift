//
//  IFConfig.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/17.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import Foundation

#if DEBUG//dev
//var DEV = true
//接口的host
let kHost = "http://yytdev.iflysec.com/api/"
let kCa_Test = "test"
#elseif BETA//test

//var DEV = true
//接口的host
let kCa_Test = "test"
let kHost = "http://xsttestapi.iflysec.com/gateway"

#else//正式服
//var DEV = false
//接口的host
let kCa_Test = ""
let kHost = "https://api.anqile.cn/api/"

#endif


//let kApp_URL = "itms-apps://apple.com/app/id1533011154"
