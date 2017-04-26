//
//  Httptools.swift
//  swift-闭包
//
//  Created by 田彬彬 on 2017/4/22.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit

class Httptools {
    
    var finisedCallBack :((_ jsonData:String)->())?
    
    // 发送网路请求的工具类
    
    // 闭包类型：(参数列表) -> (返回值类型)
    // @escaping 逃逸的
    func LoadData(_ finisedCallBack:@escaping (_ jsonData:String)->()){
        
        self.finisedCallBack = finisedCallBack
        
        // 发送异步网络请求
        DispatchQueue.global().async {

            print("发送异步网络请求并且打印当前线程\(Thread.current)")
            
            // 回到主线程
            DispatchQueue.main.sync {
                
                print("回到主线程\(Thread.current)")
                
                finisedCallBack("jsonData")
                
            }
            
        }
        
        

    }
    

}
