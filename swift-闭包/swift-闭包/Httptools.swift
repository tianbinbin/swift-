//
//  Httptools.swift
//  swift-闭包
//
//  Created by 田彬彬 on 2017/4/22.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit

class Httptools {
    
    /*
       如果你想造成强引用 也不是不可以
     */
    
    var finishedCallBlock:((_ jsonData:String)->())?
    
    // 闭包类型：(参数列表)->(返回值类型)
    // @escaping :逃逸的
    func loadData(_ finishedCallBlock:@escaping (_ jsonDataL:String)->()){
        //这一行代码打开的话会造成强引用 可可以试试
//        self.finishedCallBlock = finishedCallBlock
        
        
        // 1.发送异步网络请求
        
        DispatchQueue.global().async {
            
            print("发送异步网络请求：并打印当前线程\(Thread.current)")
            
            // 2.回到主线程
            DispatchQueue.main.sync {
                
                print("回到主线程：并打印当前线程\(Thread.current)")
                
                // 3.进行回调
                finishedCallBlock("json数据")
            }
            
        }
        
    }
    

}
