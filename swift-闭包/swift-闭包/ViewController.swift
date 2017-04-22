//
//  ViewController.swift
//  swift-闭包
//
//  Created by 田彬彬 on 2017/4/22.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var httptool:Httptools?
    // 在swift 中只要是对父类的方法进行重写 必须在方法钱加上 override
    override func viewDidLoad() {
        super.viewDidLoad()
       
        httptool = Httptools()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("点击了屏幕")
        
        weak var weakself:ViewController? = self
        /**/
        //  闭包
        httptool?.loadData({ (jsonData:String) in
            print("在viewController 中获取数据---\(jsonData)")
            
            /*
                 self. 一般是可以省略掉的 
                1> 如果改方法中有局部变量和成员属性有歧义（名称相同）
                2> 在闭包中使用成员属性
                3> 问题：想一下在这里有没有造成循环引用
                   答案：这里是没有造成循环引用的
             */

            
            
            self.view.backgroundColor = UIColor.red
            
//            weakself?.view.backgroundColor = UIColor.red
        })
    }
    
    /*
        oc 对象销毁走的是delloc 
        swift 对象销毁走的deinit
     */
    deinit {
        
        print("UIViewController 这个对象销毁了 so 没有造成强引用")
    }


}

