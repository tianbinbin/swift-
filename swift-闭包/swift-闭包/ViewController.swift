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
        
        print("点击了屏幕------")
        
        
        weak var weakselft:ViewController? = self
        
        // 闭包相当于 oc 的 block
        httptool?.LoadData({ (JsonData:String) in
            
            print("在我们的控制器中获取到数据\(JsonData)")
            
            //　这里self。 一半可以省略到 
            // 1. 如果改方中 局部变量于成员属性之间有歧义 （名称相同）
            // 2. 在闭包中使用成员属性
            weakselft?.view.backgroundColor = UIColor.red
            
        })
    }
    
    deinit {
        
        print("该对象释放了")
        
    }



}

